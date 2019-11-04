module PublishedAdsQuery
  def self.find
    Advertisement.where(status: :published).order(updated_at: :desc)
  end
end
