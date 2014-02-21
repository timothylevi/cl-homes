class CategoriesController < ApplicationController

  def index
    @categories = Category.includes(:subcategories).all
  end
  
  def show
    @category = Category.find(params[:id])
  end
  
  def map
    @category = Category.find(params[:id])
    @posts = @category.posts
    
    klass_name = @category.name
    if klass_name == "housing"
      @urls = @posts.map do |post|
        housing_post_url(post)
      end
    else
      @urls = @posts.map do |post|
        sale_post_url(post)
      end
    end

    render layout: "map_layout"
  end
  
end
