class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :current_user, :signed_in?

  def current_user
    return nil unless session[:token]
    @current_user ||= User.find_by_session_token(session[:token])
  end
  
  def sign_in!(user)
    session[:token] = user.reset_session_token!
  end
  
  def sign_out!
    current_user.reset_session_token! if current_user
    @current_user = nil
    session[:token] = nil
  end
  
  def signed_in?
    !!current_user
  end
  
  def require_signed_in
    redirect_to new_session_url unless signed_in?
  end
end
