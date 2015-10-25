class Contribution < ActiveRecord::Base
	belongs_to :user
	has_many :contributions_categories, dependent: :destroy
	has_many :categories, through: :contributions_categories

	validates_format_of :contribution_url, with: URI::regexp(%w(http https)), :presence => true, uniqueness: true

	validates :contribution_category, format: { with: /[a-zA-Z]/}

end
