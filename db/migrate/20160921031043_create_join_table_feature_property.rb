class CreateJoinTableFeatureProperty < ActiveRecord::Migration
  def change
    create_join_table :features, :properties do |t|
      # t.index [:feature_id, :property_id]
      # t.index [:property_id, :feature_id]
    end
  end
end
