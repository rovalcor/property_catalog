class Feature < ActiveRecord::Base
	#Assigned to properties for a join table
	has_and_belongs_to_many :property
end
