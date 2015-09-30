class FriendRequestController < ApplicationController
  def new
    @request = FriendRequest.new
  end
  
  def create
    @request = FriendRequest.new
    @request.user_id =  params[:user_id]
    @request.recipient_id = params[:recipient]
    
    if @request.save
      flash[:success] = "Your request has been sent."
      redirect_to '/'
    end
    
  end  
  
  private
  
  def request_params
    params.require(:authenticity_token).permit(:user_id, :recipient_id)
  end
  
end
