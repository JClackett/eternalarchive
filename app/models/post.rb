class Post < ActiveRecord::Base

	acts_as_votable
	has_many :posts_categories, dependent: :destroy
	has_many :categories, through: :posts_categories\

	has_many :users_posts, dependent: :destroy
	has_many :users, through: :users_posts
	belongs_to :user  

	validates_format_of :url, with: URI::regexp(%w(http https))
	validates_presence_of :description, :url, :category_ids

end	
