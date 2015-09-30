class PostController < ApplicationController
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.build(post_params)
    redirect_to '/'
  end
  
  
  def index
    @posts = current_user.posts
 end 
  private
  
  def post_params
    params.require(post).allow()
  end
end
