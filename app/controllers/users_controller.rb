class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    begin
      response = UsersRestClientService.new(params: safe_params.to_h).post
      log_in JSON.parse(response.body)
      redirect_to widgets_path
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