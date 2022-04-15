module ApplicationHelper
  ALERT_CLASS = {
    notice: "alert-success",
    alert:  "alert-danger"
  }.freeze

  def current_year
    Date.current.year
  end

  def github_url(author, repo)
    link_to "GitHub", "https://github.com/#{author}/#{repo}", target: "_blank", rel: "noopener"
  end

  def alert_class_name(name)
    ALERT_CLASS[name.to_sym]
  end
end
