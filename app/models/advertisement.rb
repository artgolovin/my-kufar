class Advertisement < ActiveRecord::Base
  belongs_to :user
  belongs_to :adver_type

  validates_presence_of :title
  validates_presence_of :description

  has_one_attached :image
end
