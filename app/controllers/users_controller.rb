class UsersController < ApplicationController
  before_filter :require_signed_in, only: [:show, :edit, :destroy, :watchlist, :listings]
  def new
    render layout: "intros_layout"
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
    @posts = current_user.housing_posts
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    
    if @user.update_attributes(params[:user])
      redirect_to user_url(@user)
    else
      flash.now[:errors] = @user.errors.full_messages
      render :edit
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to new_user_url
  end

  def watchlist
    @posts = current_user.watched_posts
    render :show
  end
  
  def listings
    @posts = current_user.housing_posts
    render :show
  end

end
