class UserAvatar < ActiveRecord::Base
	belongs_to :user
	has_one :avatar
end
