class HousingPostsController < ApplicationController

  CATEGORY = Category.find_by_name("housing")
  
  def new
    @category = CATEGORY
    @post = HousingPost.new
    @post.poster = current_user
  end
  
  def create
    @post = current_user.housing_posts.build(params[:post])
    
    if current_user.save
      redirect_to housing_post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :new
    end
  end
  
  def show
    @post = HousingPost.find(params[:id])
  end
  
  def edit
    @category = CATEGORY
    @post = HousingPost.find(params[:id])
  end
  
  def update
    @category = CATEGORY
    @post = HousingPost.find(params[:id])
    
    if @post.update_attributes(params[:post])
      redirect_to housing_post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :edit
    end
  end
  
  def destroy
    @post = HousingPost.find(params[:id])
    @post.destroy
    redirect_to user_url(@post.poster)
  end
end
