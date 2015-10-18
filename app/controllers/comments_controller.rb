class CommentsController < ApplicationController


  def new
    @comment = Comment.new
    @post = Post.find(comment_params[:post])
  end
  
  def create
    @comment = Comment.new
    @comment.user_id = create_params[:user_id]
    @comment.post_id = create_params[:post_id]
    @comment.comment = create_params[:comment]
    if @comment.save
      flash[:success]="Comment created"
      redirect_to '/'
    end
  end
  
  def destroy
    @comment = Comment.find(comment_params[:id])
    if @comment.user_id == current_user.id
      @comment.destroy
      flash[:success] = "Your comment has been archived against your wishes ;)   "
    end
    redirect_to '/'
  end
  
  
  
  
  
  private
  
  def comment_params
    params.permit( :author, :post, :id)
  end
  
  def create_params
    params.require(:comment).permit(:user_id, :post_id, :comment)
    end
end
