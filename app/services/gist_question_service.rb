class GistQuestionService
  
  class Response
    attr_reader :resource

    def initialize(resource, status)
      @resource = resource
      @status = status
    end

    def success?
      (200..299).cover?(@status)
    end
  end

  def initialize(question)
    @question = question
    @test = @question.test
    @client = Octokit::Client.new(access_token: ENV.fetch("GITHUB_ACCESS_TOKEN"))
  end

  def call
    Response.new(@client.create_gist(gist_params), @client.last_response.status)
  end

  private

  def gist_params
    {
      description: I18n.t("gist_question_service.description", title: @test.title),
      files:       {
        "test-guru-question.txt" => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    content = [@question.body]
    content += @question.answers.pluck(:body)
    content.join("\n")
  end
end
