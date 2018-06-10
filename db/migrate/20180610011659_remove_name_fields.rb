class RemoveNameFields < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :name
    remove_column :contacts, :name
  end
end
