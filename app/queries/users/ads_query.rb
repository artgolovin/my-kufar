module Users
  module AdsQuery
    def self.find(current_user_id, status)
      Advertisement.where(status: status).where(user_id: current_user_id).includes(:adver_type).with_attached_image.order(updated_at: :desc)
    end
  end
end
