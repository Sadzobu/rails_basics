class FeedbacksController < ApplicationController
  before_action :authenticate_user!

  def new; end

  def create
    @message = params[:message]
    FeedbacksMailer.feedback_message(current_user, @message).deliver_now
    redirect_to tests_path
  end
end
