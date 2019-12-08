class DashboardController < ApplicationController
  before_action :authenticate_user!
  before_action :set_adver_status, only: :ads

  def index; end

  def ads
    authorize :dashboard, :user?
    @ads = paginate Users::AdsQuery.find(current_user.id, @adver_status)
  end

  def adver_types
    authorize :dashboard, :administrator?
    @adver_types = paginate AdverType.all.includes(:advertisements)
  end

  def review_ads
    authorize :dashboard, :administrator?
    @ads = paginate Advertisement.where(status: :new)
  end

  private

  def set_adver_status
    @adver_status = params[:adver_status]
  end
end
