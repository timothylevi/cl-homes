class PersonalsPostsController < ApplicationController

  CATEGORY = Category.find_by_name("personals")
  
  def new
    @category = CATEGORY
    @post = PersonalsPost.new
    @post.poster = current_user
  end
  
  def create
    @post = current_user.personals_posts.build(params[:post])
    
    if current_user.save
      redirect_to personals_post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :new
    end
  end
  
  def show
    @post = PersonalsPost.find(params[:id])
  end
  
  def edit
    @category = CATEGORY
    @post = PersonalsPost.find(params[:id])
  end
  
  def update
    @category = CATEGORY
    @post = PersonalsPost.find(params[:id])
    
    if @post.update_attributes(params[:post])
      redirect_to personals_post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :edit
    end
  end
  
  def destroy
    @post = PersonalsPost.find(params[:id])
    @post.destroy
    redirect_to user_url(@post.poster)
  end

end
