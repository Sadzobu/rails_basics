module BadgesHelper
  def status(badge)
    if badge.users.include?(current_user)
      "Received"
    else
      "Not Received"
    end
  end
end
