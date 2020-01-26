module SessionsHelper
  def logged_in?
    session[:access_token].present?
  end

  def log_in(user_json)
    data = user_json['data']
    session[:access_token]  = data['token']['access_token']
    session[:refresh_token] = data['token']['refresh_token']
  end

  def log_out
    session.delete :access_token
    session.delete :refresh_token
  end

  def authenticate_user!
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
end