class UserMailer < ApplicationMailer
  default from: 'findaroof01@gmail.com'
  def welcome(user)
    @user = user  # Instance variable => available in view

    mail(to: @user.email, subject: 'Welcome to Findaroof')
    # This will render a view in `app/views/user_mailer`!
  end
end
