class UsersController < ApplicationController

  def new
  end
  
  def create
    @user = User.new(params[:user])
    
    if @user.save
      sign_in!(@user)
      redirect_to user_url(@user)
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end
  
  def show
    @user = current_user
  end
  
  def edit
    
  end
  
  def update
    
  end
  
  
  def destroy
    
  end

end
