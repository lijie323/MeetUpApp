class UserMailer < ActionMailer::Base
  default :from => "gaosng111111@gmail.com"

  def welcome_email(user)
    @user = user
    @url  = "localhost:3000"
    mail(:to => user.email, :subject => "Welcome to cspp52553 gaosong1989_lijie323 Final project")
  end

  def delete_email(user)
    @user = user
    @url  = "localhost:3000"
    mail(:to => user.email, :subject => "Your account has been killed")
  end
end
