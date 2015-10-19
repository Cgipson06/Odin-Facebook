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
    @posts = wall
    @post = Post.new
    @comment = Comment.new
    
 end 
  private
  
  def post_params
    params.require(:post).permit(:author, :title, :content)
  end
  
  def wall # populate users wall with posts from friends and self sorted by time of update
  
  # There is surely a way to add the collection directly to the rails sql query, but for time...
    friendsarray = []
    current_user.friends.each do |a|
      friendsarray << a
    end
    
    
    @posts = Post.where(:author => [ current_user.id, current_user.friends.to_a]).order(:updated_at).reverse_order
  end
    
end
