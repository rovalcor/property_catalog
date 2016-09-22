class Photo < ActiveRecord::Base
	include RankedModel
	
	#Assigned to a property, ranks inside each one
	belongs_to :property
	ranks :rank_order, with_same: :property_id
	
	#Carrierwave uploader for images
	mount_uploader :image, PhotoUploader
	
end
