class SessionsController < ApplicationController
  include SessionsHelper

  def new
  end

  def create
    session_params = safe_params.to_h.merge({'grant_type': 'password'})
    
    begin
      response = SessionsRestClientService.new(path: 'token', params: session_params).post
      log_in JSON.parse(response.body)
      redirect_to my_widgets_path
    rescue
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end

  private

    def safe_params
      params.require(:session).permit(:username, :password)
    end
end