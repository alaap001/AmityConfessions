# Preview all emails at http://localhost:3000/rails/mailers/greetings_mailer
class GreetingsMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/greetings_mailer/Welcome
  def Welcome
    GreetingsMailer.Welcome
  end

  # Preview this email at http://localhost:3000/rails/mailers/greetings_mailer/feedback
  def feedback
    GreetingsMailer.feedback
  end

end
