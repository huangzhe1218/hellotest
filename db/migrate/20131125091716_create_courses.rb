class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.text :description
      t.string :title
      t.string :poster
      t.integer :user_id
      t.boolean :public

      t.timestamps
    end
  end
end
