class CreateContact < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.integer :user_id, null: false
      t.string :name, null: false
      t.string :phone_number, null: false
    end
  end
end
