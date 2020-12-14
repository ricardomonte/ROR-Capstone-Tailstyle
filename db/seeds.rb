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
Vote.destroy_all



# SEED_DATA = {
#   articles: [
#     {
#       title: Faker::Lorem.sentence,
#       text: Faker::Lorem.paragraph,
#     },
#     {
#       title: Faker::Lorem.sentence,
#       text: Faker::Lorem.paragraph,
#     },
#     {
#       title: Faker::Lorem.sentence,
#       text: Faker::Lorem.paragraph,
#     },
#     {
#       title: Faker::Lorem.sentence,
#       text: Faker::Lorem.paragraph,
#     },
#     {
#       title: Faker::Lorem.sentence,
#       text: Faker::Lorem.paragraph,
#     },
#     {
#       title: Faker::Lorem.sentence,
#       text: Faker::Lorem.paragraph,
#     },
#     {
#       title: Faker::Lorem.sentence,
#       text: Faker::Lorem.paragraph,
#     },
#     {
#       title: Faker::Lorem.sentence,
#       text: Faker::Lorem.paragraph,
#     },
#   ]
# }

# ActiveRecord::Base.transaction do

#   users = []
#   10.times {
#     user = User.create(username: Faker::Internet.username(specifier: 5..8),
#                       name: Faker::Name.first_name,
#                       email: Faker::Internet.email(domain: 'example'),
#                       password: Faker::Internet.password)
#     users << user.id
#   }

#   articles = SEED_DATA[:articles].map do |article_attributes|
#     Article.find_or_create_by!(**article_attributes) do |article|
#       sleep(1)
#       article.author_id = users.sample
#       article.image_remote_url = 'https://pixabay.com/get/57e0d540425aaf14f1dc8460c6213378103bdded4e50774972287fd6944acc_640.jpg'
#     end
#   end

#     cat_n = Category.create(name: 'Nutrition', priority: 3)
#     cat_h = Category.create(name: 'Healthy life', priority: 4)
#     cat_g = Category.create(name: 'Grooming', priority: 2)
#     cat_e = Category.create(name: 'Entertainment', priority: 1)

#     arr_cat = [cat_n.id, cat_h.id, cat_g.id, cat_e.id]

#     3.times {
#       (articles.sample).category_ids = arr_cat.sample
#     }

#     Vote.create(user_id: users.sample, article_id: (articles.sample).id)
# end

users = []
10.times {
  user = User.create(username: Faker::Internet.username(specifier: 5..8),
                    name: Faker::Name.first_name,
                    email: Faker::Internet.email(domain: 'example'),
                    password: Faker::Internet.password)
  users << user.id
}

cat_3 = Category.create(name: 'Nutrition', priority: 3)
cat_4 = Category.create(name: 'Healthy life', priority: 4)
cat_2 = Category.create(name: 'Grooming', priority: 2)
cat_1 = Category.create(name: 'Entertainment', priority: 1)

arr_cat = [ cat_1.id, cat_2.id, cat_3.id, cat_4.id ]

arti = []
20.times {

  # file = File.new(Rails.root.join('app/assets/images/seed/' + img_dogs.sample + '.jpg'))


  art = Article.create( title: Faker::Lorem.sentence, 
                        text: Faker::Lorem.paragraphs(number: 4),
                        author_id: users.sample, 
                        remote_image_url:"http://upload.wikimedia.org/wikipedia/commons/2/28/Joan_Baez_Bob_Dylan_crop.jpg")

  arti << art.id
  4.times {
    art.category_ids = arr_cat.sample
  }
}

vote = Vote.create(user_id: users.sample, article_id: arti.sample)


p Category.count



