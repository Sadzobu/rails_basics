class TestCompletionsController < ApplicationController

  before_action :find_test_completion, only: %i[show update result]
  
  def show
  end

  def result
  end

  def update
    @test_completion.accept!(params[:answer_ids])
    if @test_completion.completed?
      redirect_to result_test_completion_path(@test_completion)
    else
      render :show
    end
  end

  private

  def find_test_completion
    @test_completion = TestCompletion.find(params[:id])
  end
end
