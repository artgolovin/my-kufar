class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @current_user_role = current_user.role.name
  end

  def published_ads
    @ads = UsersPublishedAdsQuery.find(current_user.id)
  end

  def hidden_ads
    @ads = UsersHiddenAdsQuery.find(current_user.id)
  end
end
