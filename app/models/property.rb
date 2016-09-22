class Property < ActiveRecord::Base
	has_and_belongs_to_many :features
	has_many :photos, dependent: :destroy
	accepts_nested_attributes_for :photos
	PROPERTY_TYPES = ["Apartment", "House", "Office"]
	SEARCH_TYPES = ["All fields", "Title", "Property Type", "Description"]
	validates :title, :description, presence: true
	validates :property_type, inclusion: PROPERTY_TYPES
	
	private
	def self.search(terms, search_type)
		if search_type == "Title"
			where("title like ?", "%#{terms}%")
		elsif search_type == "Description"
			where("description like ?", "%#{terms}%")
		elsif search_type == "Property Type"
			where("property_type like ?", "%#{terms}%")
		else
			where("title like ? or property_type like ? or description like ?", 
			"%#{terms}%", "%#{terms}%", "%#{terms}%")
		end
	end
	
end
