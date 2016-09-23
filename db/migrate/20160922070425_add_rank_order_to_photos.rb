class AddRankOrderToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :rank_order, :integer
  end
end
