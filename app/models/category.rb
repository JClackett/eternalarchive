class Category < ActiveRecord::Base
	has_many :posts_categories, dependent: :destroy
	has_many :posts, through: :posts_categories
	validates_presence_of :name, :parent
end
