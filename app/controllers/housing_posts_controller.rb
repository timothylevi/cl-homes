class HousingPostsController < ApplicationController
  before_filter :require_signed_in_as_broker, only: [:new, :create, :edit, :destroy, :update]
  
  def index
    @posts = fetch_posts
    render layout: "index_layout"
  end
  
  def index_map
    @posts = geo_jsonify(fetch_posts)
    render layout: "map_layout"
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
  
  def welcome_search
    @posts = HousingPost.welcome_search(params[:filters])
    render :index, layout: "index_layout"
  end
  
  def toggle_watch
    @post = HousingPost.find(params[:id])
    watch = Watch.where(user_id: current_user.id, housing_post_id: @post.id).all
    
    if watch.empty?
      watch = Watch.create(user_id: current_user.id, housing_post_id: @post.id)
      render json: {created: true}
    else
      watch.first.destroy
      render json: {destroyed: true}
    end
  end
end
