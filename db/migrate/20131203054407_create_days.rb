class CreateDays < ActiveRecord::Migration
  def change
    create_table :days do |t|
      t.integer :week_id
      t.string :id_category
      t.string :category
      t.string :cost

      t.timestamps
    end
  end
end
