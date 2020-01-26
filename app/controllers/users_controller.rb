class UsersController < ApplicationController
  include SessionsHelper

  before_action :authenticate_user!, except: [:new, :create]

  def show
    args = { path: params[:id], token: session[:access_token] }
    response = UsersRestService.new(args).get
    @user = UserParserService.parse(response)

    args = { path: params[:id] + '/widgets?term=visible', token: session[:access_token] }
    response = UsersRestService.new(args).get
    @widgets = WidgetsParserService.parse(response)
  end

  def new
    @user = User.new
  end

  def create
    begin
      response = UsersRestService.new(params: safe_params.to_h).post
      log_in JSON.parse(response.body)
      redirect_to my_widgets_path
    rescue
      flash[:danger] = 'Error message'
      render 'new'
    end
  end

  private

    def safe_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :image_url)
    end
end