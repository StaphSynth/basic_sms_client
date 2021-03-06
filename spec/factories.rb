require 'faker'

FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "reallyvalidemail#{n}@example.com" }
    password { Faker::Internet.password }
  end

  factory :contact do
    association :user
    phone_number { "04#{8.times.map { rand(10) }.join}" }
  end

  factory :message do
    association :user
    association :contact
    text { Faker::Lorem.sentence }
  end

  factory :reply do
    association :message
    association :contact
    text { Faker::Lorem.sentence }
  end
end
