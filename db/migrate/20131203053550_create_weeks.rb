class CreateWeeks < ActiveRecord::Migration
  def change
    create_table :weeks do |t|
      t.string :id_category
      t.string :category
      t.string :cost

      t.timestamps
    end
  end
end
