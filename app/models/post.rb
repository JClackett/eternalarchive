class Post < ActiveRecord::Base
	acts_as_votable
	has_many :posts_categories, dependent: :destroy
	has_many :categories, through: :posts_categories
	has_many :bookmarks
	belongs_to :user  

	validates_format_of :url, with: URI::regexp(%w(http https))

	validates_presence_of :url, :description, :category_ids


	validates :url, uniqueness: true




end	
