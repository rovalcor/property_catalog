class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.string :title
      t.string :property_type
      t.text :description

      t.timestamps
    end
  end
end
