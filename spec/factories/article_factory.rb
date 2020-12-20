require 'faker'

FactoryBot.define do
  factory :article do
    title { 'this is a test' }
    text { Faker::Lorem.paragraph_by_chars(number: 1650, supplemental: false) }
    author_id { 1 }
    image { Rack::Test::UploadedFile.new(Rails.root.join('spec', 'fixtures', 'img1.jpg'), 'image/jpg') }
  end
end
