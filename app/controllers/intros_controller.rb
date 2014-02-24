class IntrosController < ApplicationController
  layout "intros_layout", only: [:user_type, :searcher_start]
  
  def user_type
  end
  
  def searcher_start
  end
  
  def poster_start
    @post = HousingPost.new
    render layout: "non_user_post_form"
  end  
end
