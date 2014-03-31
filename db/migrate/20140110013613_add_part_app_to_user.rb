class AddPartAppToUser < ActiveRecord::Migration
  def change
    add_column :users, :group, :boolean
    add_column :users, :menu, :boolean
  end
end
