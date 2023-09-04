class RenameExistSoloTablesColumnToReviews < ActiveRecord::Migration[7.0]
  def change
    rename_column :reviews, :exist_counter_sheets?, :exist_counter_sheets
  end
end
