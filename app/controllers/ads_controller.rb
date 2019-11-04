class AdsController < ApplicationController
  def index
    @ads = paginate PublishedAdsQuery.find
  end
end
