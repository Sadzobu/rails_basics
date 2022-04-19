module GistsHelper
  def gist_question(gist)
    gist.question.body.truncate(25)
  end

  def gist_hash(gist)
    gist.url.split("/").last.to_s
  end
end
