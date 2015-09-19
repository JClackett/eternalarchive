class ContributionsCategory < ActiveRecord::Base
	belongs_to :contribution
	belongs_to :category
end
