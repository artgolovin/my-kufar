class AdsController < ApplicationController
  before_action :set_advertisement, only: :show

  def index
    @ads = paginate PublishedAdsQuery.find
  end

  def show; end

  private

  def set_advertisement
    @adver = Advertisement.find params[:id].to_i
  end
end
