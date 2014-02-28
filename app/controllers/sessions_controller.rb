class SessionsController < ApplicationController
  layout "intros_layout"
  def new
  end
  
  def create
    user = User.find_by_credentials(
      params[:user][:email],
      params[:user][:password]
    )
    
    if user
      sign_in!(user)
      if request.xhr?
        render partial: "./header"
      else
        go_to_user_page(user)
      end
    else
      if request.xhr?
        render json: {failed_sign_in: true, error_message: "Wrong credentials. Try again."}
      else
        flash.now[:errors] = ["Wrong credentials. Try again."]
        render :new
      end
    end
  end
  
  def destroy
    sign_out!
    redirect_to housing_posts_url
  end
end
