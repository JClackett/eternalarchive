class Post < ActiveRecord::Base
	acts_as_votable
	before_save :add_missing_info_from_scraper
	has_many :posts_categories, dependent: :destroy
	has_many :categories, through: :posts_categories
	has_many :bookmarks
	belongs_to :user  

	validates_format_of :url, with: URI::regexp(%w(http https))

	validates_presence_of :url, :category_ids


	validates :url, uniqueness: true




  	VideoInfo.provider_api_keys = { youtube: 'AIzaSyBDVbCw7zFhn-uXWXvSvP0Datyvh-lNfsg'}


  	def add_missing_info_from_scraper
    		@article = MetaInspector.new(self.url, faraday_options: { ssl: { verify: false } })

		if description.blank?
		            self.assign_attributes(description: @article.title)
		else
		end

   		if self.url.include?("youtube") || self.url.include?("vimeo") || self.url.include?("ted" && "talks")
 		else
			if image_url.blank?
		           	self.assign_attributes(image_url: @article.images.best.to_s)
		           end
    		end

    		self.assign_attributes(keywords: @article.meta_tag['name']['keywords'])
	end

	def self.search(query)
  		where("email like ?", "%#{query}%") 
	end

end	
