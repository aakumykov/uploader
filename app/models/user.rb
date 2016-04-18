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
		default_url: "/images/:style/missing.png"
	)

	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
end
