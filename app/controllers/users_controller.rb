class UsersController < ApplicationController

def edit
  @user = current_user
  @user.avatar = user_params[:avatar]
  end

def index
    @users = User.all
  end
def show
  @user = User.find(params[:id])
  @comment = Comment.new
  
  end
  
  private
  
  def user_params
    params.permit(:id, :avatar)
  end
end