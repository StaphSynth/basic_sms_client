class CreateMessagesReplies < ActiveRecord::Migration[5.2]
    def change
    create_table :messages do |t|
      t.integer :user_id, null: false
      t.integer :contact_id, null: false
      t.string :text, limit: 160, null: false
    end

    create_table :replies do |t|
      t.integer :message_id, null: false
      t.integer :contact_id, null: false
      t.string :text, limit: 160, null: false
    end
  end
end
