class AdverType < ActiveRecord::Base
  validates_presence_of :name

  has_many :advertisements
end
