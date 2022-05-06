class FeedbacksMailer < ApplicationMailer
  def feedback_message(user, message)
    @message = message
    @user = user
    mail(to:      ENV.fetch("ADMIN_EMAIL"),
         from:    @user.email,
         subject: "Feedback from #{@user.name}")
  end
end
