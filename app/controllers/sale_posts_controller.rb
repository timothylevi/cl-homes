class SalePostsController < ApplicationController

  CATEGORY = Category.find_by_name("sale")
  
  def new
    @category = CATEGORY
    @post = SalePost.new
    @post.poster = current_user
  end
  
  def create
    @category = CATEGORY
    @post = current_user.sale_posts.build(params[:post])
    
    if current_user.save
      redirect_to sale_post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :new
    end
  end
  
  def show
    @post = SalePost.find(params[:id])
  end
  
  def edit
    @category = CATEGORY
    @post = SalePost.find(params[:id])
  end
  
  def update
    @category = CATEGORY
    @post = SalePost.find(params[:id])
    
    if @post.update_attributes(params[:post])
      redirect_to sale_post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :edit
    end
  end
  
  def destroy
    @post = SalePost.find(params[:id])
    @post.destroy
    redirect_to user_url(@post.poster)
  end

end
