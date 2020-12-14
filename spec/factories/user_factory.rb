require 'faker'

FactoryBot.define do
  factory :user do
    username { 'carloncho' }
    name { Faker::Name.first_name }
    email { Faker::Internet.email }
    password { Faker::Internet.password }
  end
end

FactoryBot.define do
  factory :uservote, class: 'User' do
    username { Faker::Internet.username }
    name { Faker::Name.first_name }
    email { Faker::Internet.email }
    password { Faker::Internet.password }
  end
end
