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
      redirect_to user_url(user)
    else
      flash.now[:errors] = ["Wrong credentials. Try again."]
      render :new
    end
  end
  
  def destroy
    sign_out!
    redirect_to new_session_url
  end
end
