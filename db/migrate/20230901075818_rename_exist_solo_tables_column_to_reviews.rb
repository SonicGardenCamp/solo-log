class RenameExistSoloTablesColumnToReviews < ActiveRecord::Migration[7.0]
  def change
    rename_column :reviews, :exist_solo_tables?, :exist_solo_tables
  end
end
