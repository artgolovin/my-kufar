class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index; end

  def published_ads
    authorize :dashboard, :user?
    @ads = UsersPublishedAdsQuery.find(current_user.id)
  end

  def hidden_ads
    authorize :dashboard, :user?
    @ads = UsersHiddenAdsQuery.find(current_user.id)
  end
end
