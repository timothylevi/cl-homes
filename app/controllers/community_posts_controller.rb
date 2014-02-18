class CommunityPostsController < ApplicationController
  
  CATEGORY = Category.find_by_name("community")
  
  def new
    @category = CATEGORY
    @post = CommunityPost.new
    @post.poster = current_user
  end
  
  def create
    @post = current_user.community_posts.build(params[:post])
    
    if current_user.save
      redirect_to community_post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :new
    end
  end
  
  def show
    @post = CommunityPost.find(params[:id])
  end
  
  def edit
    @category = CATEGORY
    @post = CommunityPost.find(params[:id])
  end
  
  def update
    @category = CATEGORY
    @post = CommunityPost.find(params[:id])
    
    if @post.update_attributes(params[:post])
      redirect_to community_post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :edit
    end
  end
  
  def destroy
    @post = CommunityPost.find(params[:id])
    @post.destroy
    redirect_to user_url(@post.poster)
  end
end
