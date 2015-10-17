class ProfileController < ApplicationController

def new
  @profile = Current_user
end
def edit
  @profile = current_user
end

def update
  @profile = User.find(current_user.id)
  unless params[:user].nil?
     @profile.update_attribute(:avatar, params[:user][:avatar])
  end
  
  redirect_to user_path(current_user)
end


  private
    def user_params 
      params.require(:user).permit(:avatar, :commit, :id)
    end
    
end