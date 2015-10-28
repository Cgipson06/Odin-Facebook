class UsersController < ApplicationController

def new 
  @user = User.new
end

def edit
  @user = current_user
  @user.avatar = user_params[:avatar]
  end

def index
  # all users who dont have a pending friend request from, or are friends with, the current user.
  @users = User.where.not(:id => [current_user, current_user.friends.all.to_a, current_user.pending_requests.pluck(:recipient_id)])
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