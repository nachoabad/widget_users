class WidgetsController < ApplicationController
  def index
    args = { path: 'visible?term=a' }
    response = WidgetsRestService.new(args).get
    @widgets = WidgetsParserService.parse(response)
  end

  def new
    @widget = Widget.new
  end

  def create
    args = { params: safe_params.to_h, token: session[:access_token] }
    begin
      response = WidgetsRestService.new(args).post
      redirect_to my_widgets_path, notice: 'Widget created!'
    rescue
      flash[:danger] = 'Error message'
      render 'new'
    end
  end

  def edit
    args = { path: "#{params[:id]}/?", token: session[:access_token] }
    response = WidgetsRestService.new(args).get
    @widget = WidgetParserService.parse(response)
  end
  
  def update
    #TODO
  end

  def destroy
    #TODO
  end

  private

    def safe_params
      params.require(:widget).permit(:name, :description, :kind)
    end
end