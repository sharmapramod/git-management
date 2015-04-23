class InvitationMailer < ActionMailer::Base
  default from: "crunchinsights@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.invitation_mailer.invitation_mail.subject
  #
  def invitation_mail(email, sender)
    @email = email
    @sender = sender
    mail to: @email, subject: "Invitation maill from Git-Api"
  end
end
