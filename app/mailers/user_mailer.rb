class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def order_email(user, order)
    @order = order
    @user = user
    @url  = 'http://example.com/login'

    mail(to: @user.email, subject: 'Thank you for your order!')
  end
end