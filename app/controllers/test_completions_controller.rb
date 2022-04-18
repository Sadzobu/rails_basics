class TestCompletionsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_test_completion, only: %i[show update result gist]

  def show; end

  def result; end

  def update
    @test_completion.accept!(params[:answer_ids])

    if @test_completion.completed?
      TestsMailer.completed_test(@test_completion).deliver_now
      redirect_to result_test_completion_path(@test_completion)
    else
      render :show
    end
  end

  def gist
    result = GistQuestionService.new(@test_completion.current_question).call

    flash_options = if result.success?
                      { notice: t(".success") }
                    else
                      { alert: t(".failure") }
                    end

    redirect_to @test_completion, flash_options
  end

  private

  def find_test_completion
    @test_completion = TestCompletion.find(params[:id])
  end
end
