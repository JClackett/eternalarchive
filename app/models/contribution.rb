class Contribution < ActiveRecord::Base
	belongs_to :user
	has_many :contributions_categories, dependent: :destroy
	has_many :categories, through: :contributions_categories

	validates_format_of :contribution_url, with: URI::regexp(%w(http https))

	validates_presence_of :contribution_url 


end
