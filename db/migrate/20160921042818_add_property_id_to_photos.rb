class AddPropertyIdToPhotos < ActiveRecord::Migration
  def up
    add_column :photos, :property_id, :string
  end
  
  def down
    remove_column :photos, :property_id
  end
end
