class WelcomeMailer < ApplicationMailer
  default from: "info@expobellydancecr.com"

  def welcome_email(user)
    @subscriber = user
    mail(to: @subscriber.email, subject: 'Sample Email')
  end
end
