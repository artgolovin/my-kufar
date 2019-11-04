class AdsController < ApplicationController
  def index
    @ads = PublishedAdsQuery.find
  end
end
