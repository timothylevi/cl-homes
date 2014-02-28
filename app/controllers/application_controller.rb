class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :current_user, :signed_in?

  def current_user
    return nil unless session[:token]
    @current_user ||= User.find_by_session_token(session[:token])
  end
  
  def fetch_posts
    if params[:filters]
      HousingPost.search_by_filters(params[:filters])
    elsif params[:welcome_filters]
      @posts = HousingPost.welcome_search(params[:welcome_filters])
    else
      HousingPost.order('created_at desc').all
    end
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
    unless signed_in?
      if request.xhr?
        render json: {not_signed_in: true}
      else
        flash[:notices] = ["Sorry, you have to be logged in for that!"]
        redirect_to new_session_url
      end
    end
  end
  
  def require_signed_in_as_broker
    unless signed_in? && current_user.broker
      flash[:notices] = ["Almost there! We just need a bit more info from you before you can post listings"]
      redirect_to new_broker_url
    end
  end
  
  def go_to_user_page(user)
    if user.broker
      redirect_to user_listings_url
    else
      redirect_to user_watchlist_url
    end
  end
end
