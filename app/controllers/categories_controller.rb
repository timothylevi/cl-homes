class CategoriesController < ApplicationController

  def index
    @categories = Category.includes(:subcategories).all
  end
  
  def show
    @category = Category.find(params[:id])
  end
  
end
