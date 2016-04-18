class User < ActiveRecord::Base
	enum kind: { 'текст'=>'text', 'картинка'=>'picture', 'звук'=>'audio', 'видео'=>'video' }

	validates :name, presence: true

	validates :kind, { presence:true }

	has_attached_file(
		:avatar,
		styles: {
			medium: "120x120>",
			thumb: "32x32>"
		},
		:storage => :s3,
		:s3_region => ENV['AWS_REGION'],
		:bucket => 'uploader-54724724rg', 
		:s3_credentials => {
			:access_key_id => ENV['AWS_ACCESS_KEY'], 
			:secret_access_key => ENV['AWS_SECRET_ACCESS_KEY'],
		}
	)

	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
end
