class FeedbacksMailer < ApplicationMailer
  ADMIN_EMAIL = "admin_1@ya.ru".freeze

  def feedback_message(user, message)
    @message = message
    @user = user
    mail(to:      ADMIN_EMAIL,
         from:    @user.email,
         subject: "Feedback from #{@user.name}")
  end
end
