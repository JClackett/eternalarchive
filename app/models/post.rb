class Post < ActiveRecord::Base
	has_many :post_categories, dependent: :destroy
	has_many :categories, through: :post_categories
end
