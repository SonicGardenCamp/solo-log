class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.references :shop, null: false, foreign_key: true
      t.integer :rate
      t.text :comment
      t.boolean :exist_counter_sheets?
      t.integer :frequent_solo_visitors
      t.boolean :exist_solo_tables?
      t.integer :easy_to_order
      t.integer :delivery_speed
      t.integer :calmness

      t.timestamps
    end
  end
end
