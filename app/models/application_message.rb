class ApplicationMessage < ApplicationRecord
  MAX_SMS_CHARS = 160

  validates :text, presence: true,
                   length: { maximum: MAX_SMS_CHARS }
end
