class User < ActiveRecord::Base
	enum kind: { 'текст'=>'text', 'картинка'=>'picture', 'звук'=>'audio', 'видео'=>'video' }

	has_attached_file :avatar, {
		styles: lambda { |file|
			#puts "===== styles lambda =====> #{file.content_type}"
			list = {
				'audio' => nil,
				'image' => { medium: "180x180>", thumb: "50x50>" },
			}
			list.each { |pattern,style|
				if file.content_type.match("^#{Regexp.escape(pattern)}/") then
					puts "СОВПАДЕНИЕ: #{pattern} => #{style}"
					return style
				end
			}
		},
		#~ processors: lambda { |file|
			#~ puts "===== styles lambda =====> #{file.class}"
			#~ list = {
				#~ 'audio' => nil,
				#~ 'image' => nil,
			#~ }
			#~ list.each { |pattern,style|
				#~ if file.content_type.match("^#{Regexp.escape(pattern)}/") then
					#~ puts "СОВПАДЕНИЕ: #{pattern} => #{style}"
					#~ return style
				#~ end
			#~ }
		#~ }
	}

	validates :name, presence: true

	validates :kind, { presence:true }

	#validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
	#validates :avatar, attachment_presence: true
	#validates :avatar, attachment_size: { less_than: 1.megabytes }
	#validates :avatar, attachment_content_type: { content_type: 'application/vnd.oasis.opendocument.text' }
	#validates :avatar, attachment_content_type: { content_type: 'application/msword' }
	validates(
		:avatar, 
		attachment_content_type: { 
			content_type: [
				'image/jpeg',
				'image/png',
				'image/gif',
				'audio/x-vorbis+ogg',
				'audio/mpeg',
			]
		}
	)
end
