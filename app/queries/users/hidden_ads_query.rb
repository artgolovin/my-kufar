module Users
  module HiddenAdsQuery
    def self.find(current_user_id)
      Advertisement.where.not(status: :published).where(user_id: current_user_id).order(updated_at: :desc)
    end
  end
end
