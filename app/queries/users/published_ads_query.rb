module Users
  module PublishedAdsQuery
    def self.find(current_user_id)
      Advertisement.where(status: :published, user_id: current_user_id).order(updated_at: :desc)
    end
  end
end
