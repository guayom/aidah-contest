# Preview all emails at http://localhost:3000/rails/mailers/welcome_mailer
class WelcomeMailerPreview < ActionMailer::Preview
  def welcome_email_preview
    WelcomeMailer.sample_email(Subscriber.first)
  end
end