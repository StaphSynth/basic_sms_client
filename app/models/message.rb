class Message < ApplicationMessage
  self.table_name = 'messages'

  belongs_to :user
  belongs_to :contact
  has_many :replies, class_name: 'Reply'
end
