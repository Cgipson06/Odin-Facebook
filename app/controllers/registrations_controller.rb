class RegistrationsController < Devise::RegistrationsController
 def create
      super
      # commented out due to mailer service pending approval
      UserMailer.welcome_email(@user).deliver  
      #quick and dirty initial friendship.
      initialfriend = Friendship.new(:invitor =>  @user.id, :invitee => "8")
      initialfriend.save
      initialfriend = Friendship.new(:invitor =>  "8", :invitee => @user.id)
      initialfriend.save
    end
end