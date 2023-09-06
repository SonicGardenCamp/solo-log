class RemoveImageUrlFromShops < ActiveRecord::Migration[7.0]
  def change
    remove_column :shops, :image_url, :string
  end
end
