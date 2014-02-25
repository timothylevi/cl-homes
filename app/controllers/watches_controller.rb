class WatchesController < ApplicationController
  before_filter :require_signed_in
  
  def create
    @post = HousingPost.find(params[:id])
    watch = @post.watches.build(user_id: current_user.id)
    flash[:errors] = ["Sorry. We were unable to save this post to your watch list"] unless watch.save
    render "housing_posts/show"
  end
  
  def destroy
    watch = Watch.find(params[:id])
    @post = watch.housing_post
    watch.destroy
    render "housing_posts/show"
  end

end
