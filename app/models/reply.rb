class Reply < ApplicationMessage
  self.table_name = 'replies'

  belongs_to :message
  belongs_to :contact
end
