class TestCompletionsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_test_completion, only: %i[show update result]

  def show; end

  def result; end

  def update
    if @test_completion.time_is_up?
      redirect_to result_test_completion_path(@test_completion), alert: 'Your time is up!' 
    else
      @test_completion.accept!(params[:answer_ids])

      if @test_completion.completed?
        @test_completion.score!
        TestsMailer.completed_test(@test_completion).deliver_now
        new_badges = BadgeService.new(@test_completion).call if @test_completion.success?
        flash_options = new_badges.present? ? { notice: 'You got a new badge' } : {}
    
        redirect_to result_test_completion_path(@test_completion), flash_options
      else
        render :show
      end
    end
  end

  private

  def find_test_completion
    @test_completion = TestCompletion.find(params[:id])
  end
end
