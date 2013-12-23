class AddAppToUsers < ActiveRecord::Migration
  def change
    add_column :users, :weibo, :boolean
    add_column :users, :game, :boolean
  end
end
