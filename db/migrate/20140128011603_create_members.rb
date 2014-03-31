class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :name
      t.string :phonenum
      t.string :password_digest
      t.string :token

      t.timestamps
    end
  end
end
