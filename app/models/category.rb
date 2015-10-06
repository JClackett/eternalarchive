class Category < ActiveRecord::Base
	has_many :posts_categories, dependent: :destroy
	has_many :posts, through: :posts_categories
	has_many :contributions, through: :contributions_categories
	has_many :contributions_categories, dependent: :destroy
	validates_presence_of :name
	validates :name, uniqueness: true
end
