class FriendshipController < ApplicationController

def new
  @friendship = Friendship.new
  
end

def create 
  user_a = friend_params[:invitor]
  user_b = friend_params[:invitee]
  2.times do 
    @friendship = Friendship.new
    @friendship.invitor = user_a
    @friendship.invitee = user_b
    user_a,user_b = user_b,user_a
    unless @friendship.save
      flash[:error] = "There was a problem with the request"
    end
  end
  
  #same friend request as this friendship
  removal_friendship = current_user.friend_requests.find_by user_id: friend_params[:invitee]
  removal_friendship.destroy
  flash[:success]= "You have a new Friend"
  redirect_to '/'
end


  private
  
  def friend_params
    params.permit(:invitor, :invitee)
  end
end
