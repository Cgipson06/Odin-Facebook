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
 end 
  private
  
  def post_params
    params.require(:post).permit(:author, :title, :content)
  end
  
  def wall # populate users wall with posts from friends and self sorted by time of update
  #need to find the correct way to populate  Post.where(i authored or friends authored)
    friends = []
    current_user.friendships.each do |a|
      friends << a.invitor
    end
    
    
    @posts = Post.where(:author => [ current_user.id, friends]).order(:updated_at).reverse_order
  end
    
end
