class User < ApplicationRecord
  include Clearance::User

  has_many :contacts
  has_many :messages

  EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  validates :email, length: { maximum: 255 },
                    format: { with: EMAIL_REGEX }
end
