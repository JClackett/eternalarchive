class Category < ActiveRecord::Base
	has_many :posts_categories, dependent: :destroy
	has_many :posts, through: :posts_categories
	has_many :contributions, through: :contributions_categories
	has_many :contributions_categories, dependent: :destroy
	validates_presence_of :name
	validates :name, uniqueness: true
  	before_save :upcase_stuff




	def upcase_stuff
		@titleized_name = self.name.titleize
		self.assign_attributes(name: @titleized_name)
    	 end
end
