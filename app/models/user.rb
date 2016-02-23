class User < ActiveRecord::Base
	enum kind: { 'текст'=>'text', 'картинка'=>'picture', 'звук'=>'audio', 'видео'=>'video' }

	has_attached_file :avatar
	validates_attachment_content_type :avatar, 
	content_type: [
		#~ /.*/,
		#~ 'audio/mpeg', 
		#~ 'audio/x-mpeg', 
		#~ 'audio/mp3', 
		#~ 'audio/x-mp3', 
		#~ 'audio/mpeg3', 
		#~ 'audio/x-mpeg3', 
		#~ 'audio/mpg', 
		#~ 'audio/x-mpg', 
		#~ 'audio/x-mpegaudio',
		'audio/ogg',
		'audio/x-ogg',
		'video/ogg',
		'video/x-ogg',
		'application/ogg',
		'application/x-ogg',
		'application/msword',
		'application/vnd.oasis.opendocument.text',
		'application/pdf',
	]

	validates :name, presence: true

	validates :kind, { presence:true }

	#validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
	#validates :avatar, attachment_presence: true
	#validates :avatar, attachment_size: { less_than: 1.megabytes }
	#validates :avatar, attachment_content_type: { content_type: 'application/vnd.oasis.opendocument.text' }
	#validates :avatar, attachment_content_type: { content_type: 'application/msword' }
	#~ validates(
		#~ :avatar, 
		#~ attachment_content_type: { 
			#~ content_type: [
				#~ 'image/jpeg',
				#~ 'image/png',
				#~ 'image/gif',
				#~ 'audio/x-vorbis+ogg',
				#~ 'audio/mpeg',
			#~ ]
		#~ }
	#~ )
end
