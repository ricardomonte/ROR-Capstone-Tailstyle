require 'faker'

FactoryBot.define do
  factory :category do
    name { Faker::BossaNova.song }
    priority { 3 }
  end
end

FactoryBot.define do
  factory :categoryfeature do
    name { 'Nutrition' }
    priority { 2 }
  end
end
