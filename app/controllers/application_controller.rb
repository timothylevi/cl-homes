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
    unless signed_in?
      flash[:notices] = ["Sorry, you have to be logged in for that!"]
      redirect_to new_session_url 
    end
  end
  
  def geo_jsonify(posts)
    json_objs = []
    
    posts.each do |post|
      description = "$#{post.rent} / #{post.beds} BR - #{post.specific_location}"
      
      if post.pictures.count > 0
        images = []
        
        post.pictures.each { |pic| images << pic.photo.url(:medium) }
        
        json_objs << {
          type: "Feature",
          geometry: { type: "Point", coordinates: [post.longitude.to_f, post.latitude.to_f] },
          properties: {
            title: "<a href=\"#{Rails.application.routes.url_helpers.housing_post_path(post)}\">#{post.title}</a>".html_safe,
            description: description,
            "marker-color" => "#fc4353",
            "marker-size" => "medium",
            images: images
          }
        }
      else
        json_objs << {
          type: "Feature",
          geometry: { type: "Point", coordinates: [post.longitude.to_f, post.latitude.to_f] },
          properties: {
            title: "<a href=\"#{Rails.application.routes.url_helpers.housing_post_path(post)}\">#{post.title}</a>".html_safe,
            description: description,
            "marker-color" => "#fc4353",
            "marker-size" => "medium"
          }
        }
      end
    end
    
    json_objs
  end
end
