module PublishedAdsQuery
  def self.find
    Advertisement.where(status: :published).includes(:adver_type).with_attached_image.order(updated_at: :desc)
  end
end
