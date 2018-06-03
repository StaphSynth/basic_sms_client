require 'faker'

FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    sequence(:email) { |n| "reallyvalidemail#{n}@example.com" }
    password { Faker::Internet.password }
  end
end
