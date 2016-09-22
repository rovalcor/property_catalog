class Photo < ActiveRecord::Base
	
	include RankedModel
	
	mount_uploader :image, PhotoUploader
	
	belongs_to :property
	ranks :rank_order, with_same: :property_id
end
