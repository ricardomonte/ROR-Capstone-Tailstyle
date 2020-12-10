# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

Category.destroy_all
Article.destroy_all
User.destroy_all

users = []
10.times {
  user = User.create(username: Faker::Internet.username(specifier: 5..8),
                    name: Faker::Name.first_name,
                    email: Faker::Internet.email(domain: 'example'),
                    password: Faker::Internet.password)
  users << user.id
}

cat_n = Category.create(name: 'Nutrition', priority: 3)
cat_h = Category.create(name: 'Healthy life', priority: 4)
cat_g = Category.create(name: 'Grooming', priority: 2)
cat_e = Category.create(name: 'Entertainment', priority: 1)

arr_cat = [cat_n.id, cat_h.id, cat_g.id, cat_e.id]

img_dogs = ["img1", "img2", "img3", "img4", "img5", "img6", "img7"]

7.times {
  uploader = ImageUploader.new(:store)
  file = File.new(Rails.root.join('app/assets/images/seed/' + img_dogs.sample + '.jpg'))
  uploaded_file = uploader.upload(file)

  art = Article.create( title: Faker::Lorem.sentence, 
                        text: Faker::Lorem.paragraph, 
                        author_id: users.sample, 
                        image_data: uploaded_file.to_json )

  3.times {
    art.category_ids = arr_cat.sample
  }
}
p Article.count



