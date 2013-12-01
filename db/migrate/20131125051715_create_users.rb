class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :token
      t.string :mac
      t.string :name

      t.timestamps
    end
  end
end
