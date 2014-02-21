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
    render layout: "map_layout"
  end
  
end
