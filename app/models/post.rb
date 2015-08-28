class Post < ActiveRecord::Base
	after_create :add_information_from_video_info
	acts_as_votable
	has_many :posts_categories, dependent: :destroy
	has_many :categories, through: :posts_categories
	has_many :bookmarks
	belongs_to :user  

	validates_format_of :url, with: URI::regexp(%w(http https))
	validates_presence_of :url, :category_ids

	def self.add_all_video_info #only for use in console to update current data

		Post.all.each do |post|
			post.add_information_from_video_info
		end
		
	end

	def add_information_from_video_info
		if description.blank?
			VideoInfo.provider_api_keys = { youtube: 'AIzaSyAXqfIaKFn-kb8YXb4CVIQjgn7TKxDjlNM', vimeo: 'fc31a8eb303853203d03a5cf2115a20a87c7ff71'}
		    video = VideoInfo.new(url)
		    self.update_columns(description: video.title)
		else
		end
	end

end	
