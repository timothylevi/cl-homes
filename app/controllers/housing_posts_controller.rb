class HousingPostsController < ApplicationController
  
  def index
    # refactor into general helper method - @posts = HousingPost.find_by_search(params[:filters])
    if params[:filters]
      @posts = HousingPost.where(
        region: params[:filters][:regions], 
        housing_type: params[:filters][:housing_types],
        category: params[:filters][:category]
      )
    else
      @posts = HousingPost.all
    end
  end
  
  def new
    @post = HousingPost.new
    @post.poster = current_user
  end
  
  def create
    @post = current_user.housing_posts.build(params[:post])
    @post.apply_options(params[:other_options]) if params[:other_options]
    
    if params[:pictures]
      params[:pictures].each do |pic_data|
        @post.pictures.build(photo: pic_data)
      end
    end
    
    if @post.save
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
    @post = HousingPost.find(params[:id])
  end
  
  def update
    @post = HousingPost.find(params[:id])
    @post.apply_options(params[:other_options]) if params[:other_options]
    
    if params[:pictures]
      params[:pictures].each do |pic_data|
        @post.pictures.build(photo: pic_data)
      end
    end
    
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
