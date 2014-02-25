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
    else
      HousingPost.all
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
    flash[:notices] = ["Sorry, you have to be logged in for that!"]
    redirect_to new_session_url unless signed_in?
  end
  
  def geo_jsonify(posts)
    json_objs = []
    
    posts.each do |post|
      description = "$#{post.rent} / #{post.beds} BR - #{post.specific_location}"
      json_objs << {
        type: "Feature",
        geometry: {
          type: "Point",
          coordinates: [post.longitude, post.latitude]
        },
        properties: {
          title: post.title,
          description: description,
          "marker-color" => "#fc4353",
          "marker-size" => "small"
        }
      }
    end
    
    json_objs
  end
end
