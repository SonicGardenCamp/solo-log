class RemoveLatLongFromReviews < ActiveRecord::Migration[7.0]
  def change
    remove_column :reviews, :latitude, :float
    remove_column :reviews, :longitude, :float
  end
end
