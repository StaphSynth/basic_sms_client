class User < ApplicationRecord
  include Clearance::User

  EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  validates :name, presence: true,
                   length: { maximum: 50 }

  validates :email, length: { maximum: 255 },
                    format: { with: EMAIL_REGEX }
end
