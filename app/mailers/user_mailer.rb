class UserMailer < ApplicationMailer
  default from: 'notifications@CodyGipson.xyz'
  
   def welcome_email(user)
    @user = user
    @url  = 'http://vast-forest.herokuapp.com'
    mail(to: @user.email, subject: 'Welcome to Cody-Facebook')
  end
end
