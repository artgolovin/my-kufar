class User < ActiveRecord::Base
  devise :database_authenticatable

  belongs_to :role
  has_many :advertisement
end
