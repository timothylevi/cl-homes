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
      go_to_user_page(user)
    else
      flash.now[:errors] = ["Wrong credentials. Try again."]
      render :new
    end
  end
  
  def destroy
    sign_out!
    redirect_to housing_posts_url
  end
end
