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
        BadgeService.new(@test_completion).call
    
        redirect_to result_test_completion_path(@test_completion)
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
