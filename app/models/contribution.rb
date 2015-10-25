class Contribution < ActiveRecord::Base
	belongs_to :user
	has_many :contributions_categories, dependent: :destroy
	has_many :categories, through: :contributions_categories

	validates_format_of :contribution_url, with: URI::regexp(%w(http https)), :presence => true

	validates :contribution_url, uniqueness: true

	validates_format_of :contribution_category, :with => /^[a-zA-Z]$/, :allow_blank => true, :multiline => true

	validates_presence_of :category_ids



end
