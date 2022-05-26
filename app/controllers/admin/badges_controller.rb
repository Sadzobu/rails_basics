class Admin::BadgesController < Admin::BaseController
  before_action :set_badges, only: %i[index]
  before_action :find_badge, only: %i[destroy]

  def index; end

  def new
    @badge = Badge.new
  end

  def create
    @badge = Badge.new(badge_params)
    if @badge.save
      redirect_to admin_badges_path
    else
      render :new
    end
  end

  def destroy
    @badge.destroy
    redirect_to admin_badges_path
  end

  private

  def set_badges
    @badges = Badge.all
  end

  def find_badge
    @badge = Badge.find(params[:id])
  end

  def badge_params
    params.require(:badge).permit(:name, :rule, :rule_value)
  end
end
