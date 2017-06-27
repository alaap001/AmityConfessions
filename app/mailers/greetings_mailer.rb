class GreetingsMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.greetings_mailer.Welcome.subject
  #
  def Welcome(amitian)
    @greeting = "Hi"
    @amitian = amitian
    mail (to: @amitian.email , subject: 'We Welcome you to Amity Confessions')
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.greetings_mailer.feedback.subject
  #
  def feedback
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
