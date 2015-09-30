class PostsController < ApplicationController
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(post_params)
    @post.save
    redirect_to '/'
  end
  
  
  def index
    @posts = current_user.posts
 end 
  private
  
  def post_params
    params.require(:post).permit(:author, :title, :content)
  end
end
