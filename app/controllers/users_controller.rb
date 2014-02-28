class UsersController < ApplicationController
  before_filter :require_signed_in, only: [:show, :edit, :destroy, :watchlist, :listings]
  
  def new
    @user = User.new
    render layout: "intros_layout"
  end
  
  def new_broker
    @user = signed_in? ? current_user : User.new
    render layout: "intros_layout"
  end
  
  def create
    @user = User.new(params[:user])
    
    if @user.save
      sign_in!(@user)
      if @user.broker
        redirect_to new_housing_post_url
      else
        redirect_to user_watchlist_url
      end
    else
      flash.now[:errors] = @user.errors.full_messages
      if @user.broker
        render :new_broker, layout: "intros_layout"
      else
        render :new, layout: "intros_layout"
      end
    end
  end
  
  def show
    @posts = current_user.housing_posts
    render layout: "user_show_layout"
  end
  
  def edit
    @user = User.find(params[:id])
 
    if @user.broker
      render :edit_broker
    else
      render :edit
    end
  end
  
  def update
    @user = User.find(params[:id])
    
    if @user.update_attributes(params[:user])
      go_to_user_page(@user)
    else
      flash.now[:errors] = @user.errors.full_messages
      if @user.broker
        render :edit_broker
      else
        render :edit
      end
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to new_user_url
  end

  def watchlist
    @watches = current_user.watches.includes(:housing_post)
    render layout: "user_show_layout"
  end
  
  def listings
    @posts = current_user.housing_posts
    render layout: "user_show_layout"
  end
end
