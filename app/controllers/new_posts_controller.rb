class NewPostsController < ApplicationController
  
  def pick_cat
    @categories = Category.all
  end
end
