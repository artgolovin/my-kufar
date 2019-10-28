class AdsController < ApplicationController
  def index
    @ads = Advertisement.where(status: :published).order(updated_at: :desc)
  end
end
