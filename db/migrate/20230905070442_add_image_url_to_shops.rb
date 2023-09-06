class AddImageUrlToShops < ActiveRecord::Migration[7.0]
  def change
    add_column :shops, :image_url, :string
  end
end
