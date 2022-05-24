class Admin::BadgesController < Admin::BaseController
  before_action :set_badges, only: %i[index]
  before_action :find_badge, only: %i[show]

  def index; end

  def show;  end

  def new
    @badge = Badge.new
  end

  def create
    @badge = current_user.created_badges.new(badge_params)
    if @badge.save
      redirect_to admin_badges_path
    else
      render :new
    end
  end

  def edit; end

  def update; end

  def destroy; end

  private

  def set_badges
    @badges = Badge.all
  end

  def find_badge
    @badge = Badge.find(params[:id])
  end

  def badge_params
    params.require(:badge).permit(:name, :rule)
  end
end
