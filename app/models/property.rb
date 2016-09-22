class Property < ActiveRecord::Base
	has_and_belongs_to_many :features
	has_many :photos, dependent: :destroy
	accepts_nested_attributes_for :photos
	PROPERTY_TYPES = ["Apartment", "House", "Office"]
	validates :title, :description, presence: true
	validates :property_type, inclusion: PROPERTY_TYPES
	
	private
	def self.search(terms)
		where("title like ? or property_type like ? or description like ?", 
			"%#{terms}%", "%#{terms}%", "%#{terms}%")
	end
	
end
