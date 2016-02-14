class Avatar < ActiveRecord::Base
	belongs_to :user_avatar

	has_attached_file :avatar, styles: { medium: "180x180>", thumb: "50x50>" }, default_url: "/images/:style/missing.png"
	#validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
	validates :avatar, attachment_presence: true
	validates :avatar, attachment_size: { less_than: 1.megabytes }
	validates :avatar, attachment_content_type: { content_type: ['image/png','image/jpeg'] }
	#validates :avatar, attachment_content_type: { content_type: 'application/vnd.oasis.opendocument.text' }
	#validates :avatar, attachment_content_type: { content_type: 'application/msword' }
end
