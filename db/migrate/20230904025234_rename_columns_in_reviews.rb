class RenameColumnsInReviews < ActiveRecord::Migration[7.0]
  def change
    rename_column :reviews, :exist_counter_sheets, :counter_sheets_available
    rename_column :reviews, :exist_solo_tables, :solo_tables_available
  end
end
