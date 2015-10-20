class PostsController < ApplicationController
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new
    @post.author = User.find(post_params[:author])
    @post.content = post_params[:content]
    @post.save
    redirect_to authenticated_root_path
  end
  
  
  def index
    @posts = wall
    @post = Post.new
    @comment = Comment.new
    
 end 
  private
  
  def post_params
    params.require(:post).permit(:author, :title, :content)
  end
  
  def wall # populate users wall with posts from friends and self sorted by time of update
    @posts = Post.where(:author => [ current_user.id, current_user.friends.to_a]).order(:updated_at).reverse_order
  end
    
end
