class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index; end

  def published_ads
    authorize :dashboard, :user?
    @ads = Users::PublishedAdsQuery.find current_user.id
  end

  def hidden_ads
    authorize :dashboard, :user?
    @ads = Users::HiddenAdsQuery.find current_user.id
  end
end
