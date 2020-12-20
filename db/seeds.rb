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

img1 = 'https://cdn.pixabay.com/photo/2017/09/03/17/26/woman-2711279_960_720.jpg'
img2 = 'https://cdn.pixabay.com/photo/2015/08/15/10/11/dog-889376_960_720.jpg'
img3 = 'https://cdn.pixabay.com/photo/2014/12/10/05/50/english-bulldog-562723_960_720.jpg'
img4 = 'https://cdn.pixabay.com/photo/2015/02/21/10/39/dog-644111_960_720.jpg'
img5 = 'https://cdn.pixabay.com/photo/2019/07/30/05/53/dog-4372036_960_720.jpg'
img6 = 'https://cdn.pixabay.com/photo/2020/11/12/13/44/labrador-retriever-5735582_960_720.jpg'
img7 = 'https://cdn.pixabay.com/photo/2016/02/18/18/37/puppy-1207816_960_720.jpg'

img_arr = [ img1, img2, img3, img4, img5, img6, img7]


24.times {

  art = Article.create( title: Faker::Lorem.sentence, 
                        text: Faker::Lorem.paragraph_by_chars(number: 1650, supplemental: false),
                        author_id: users.sample, 
                        remote_image_url: img_arr.sample )

  arti << art.id
  4.times {
    art.category_ids = arr_cat.sample
  }
}

vote = Vote.create(user_id: users.sample, article_id: arti.sample)


p Category.count
p Article.count
p User.count



