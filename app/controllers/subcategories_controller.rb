class SubcategoriesController < ApplicationController
  # before_filter :require_admin, only: [:new, :create]

  def new
    @sub = Subcategory.new(category_id: params[:id])
  end
  
  def create
    @sub = Subcategory.new(params[:sub])
    
    if @sub.save
      flash[:notices] = [@sub.name + " added to " + @sub.category.name  + " category."]
      redirect_to root_url
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :new
    end
  end
  
  def show
    @sub = Subcategory.find(params[:id])
  end
end
