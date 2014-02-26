class HousingPostsController < ApplicationController
  before_filter :require_signed_in, only: [:new, :edit, :destroy, :update]
  layout "index_layout", only: [:index]
  layout "map_layout", only: [:index_map]
  
  def index
    @posts = fetch_posts
  end
  
  def index_map
    @posts = geo_jsonify(fetch_posts)
  end
  
  def new
    @post = HousingPost.new
    
    if !signed_in?
      render layout: "non_user_post_form"
    else
      @post.poster = current_user
    end
  end
  
  def create
    @post = HousingPost.new(params[:post])
    @post.apply_options(params[:other_options]) if params[:other_options]
    
    if params[:pictures]
      params[:pictures].each do |pic_data|
        @post.pictures.build(photo: pic_data)
      end
    end
    
    if signed_in?
      @post.poster = current_user
    else
      user_attrs = {
        email: @post.contact_email,
        username: @post.contact_name, 
        phone: @post.contact_phone,
        password: params[:password]
      }
      
      user = User.new(user_attrs)
      @post.poster = user
    end

    if user.save
      sign_in!(user)
      if @post.save
        redirect_to housing_post_url(@post)
      else
        flash.now[:errors] = @post.errors.full_messages
        render :new
      end
    else
      flash.now[:errors] =  @post.valid? ? user.errors.full_messages : 
                                         user.errors.full_messages + @post.errors.full_messages
      render "./intros/poster_start", layout: "non_user_post_form"
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
end
