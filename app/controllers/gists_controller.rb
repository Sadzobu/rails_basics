class GistsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_test_completion, only: %i[create]

  def create
    result = GistQuestionService.new(@test_completion.current_question).call
    flash_options = if result.success?
                      Gist.create(url:      gist_url(result),
                                  question: @test_completion.current_question,
                                  author:   current_user)
                      { notice: gist_link(result) + t(".success") }
                    else
                      { alert: t(".failure") }
                    end

    redirect_to @test_completion, flash_options
  end

  private

  def gist_url(result)
    result.resource["html_url"]
  end

  def gist_link(result)
    view_context.link_to("Gist", gist_url(result)).to_s
  end

  def find_test_completion
    @test_completion = TestCompletion.find(params[:id])
  end

end
