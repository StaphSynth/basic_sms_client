class Contact < ApplicationRecord
  DIGITS_IN_PHONE_NUMBER = 10
  AU_MOB_REGEX = /\A04\d{8}\z/

  belongs_to :user
  has_many :messages
  has_many :replies, class_name: 'Reply'

  validates :phone_number, presence: true,
                           length: { maximum: DIGITS_IN_PHONE_NUMBER },
                           format: { with: AU_MOB_REGEX }
end
