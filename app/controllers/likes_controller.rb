class LikesController < ApplicationController


  def new
    @like = Like.new
  end
  
  def create
    @like = Like.new
    @like.post_id = like_params[:post_id]
    @like.user_id = like_params[:user_id]
    if @like.save
      redirect_to '/'
    end
  end
  
  
  private
  
  def like_params
    params.permit(:post_id, :user_id)
  end
end
