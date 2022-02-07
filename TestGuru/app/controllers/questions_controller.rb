class QuestionsController < ApplicationController
  before_action :find_test, only: [:index, :create]
  before_action :find_question, only: [:show, :destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :question_not_found

  def index
    render plain: @test.questions.pluck(:body).join("\n")
  end

  def show
    render plain: @question.body
  end

  def new; end

  def create
    question = @test.questions.new(question_params)
    if question.save
      redirect_to action: 'index', notice: 'Question was successfully created!'
    else
      redirect_to action: 'new', notice: 'Question was not created!'
    end
  end

  def destroy
    @question.destroy
    redirect_to action: 'index', notice: 'Question was destroyed!'
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def question_not_found
    render plain: "Can't find question!"
  end
end
