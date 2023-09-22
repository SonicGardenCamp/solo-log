class AddRateToShop < ActiveRecord::Migration[7.0]
  def change
    add_column :shops, :rate, :float, default: 0
  end
end
