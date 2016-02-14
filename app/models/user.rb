class User < ActiveRecord::Base
	has_one :user_avatar
	has_one :avatar, through: :user_avatar

	validates :name, presence: true
end
