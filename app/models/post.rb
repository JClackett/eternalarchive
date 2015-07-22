class Post < ActiveRecord::Base
	has_many :posts_categories, dependent: :destroy
	has_many :categories, through: :posts_categories
end
