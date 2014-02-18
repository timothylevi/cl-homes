class CommunityPostsController < ApplicationController
  def new
    @category = Category.find_by_name("community")
    @post = CommunityPost.new
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
    
  end
  
  def update
    
  end
  
  def destroy
    
  end
end
