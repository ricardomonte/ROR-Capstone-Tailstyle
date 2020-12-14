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

img1 = 'https://cdn.pixabay.com/photo/2017/09/03/17/26/woman-2711279_960_720.jpg'
img2 = 'https://cdn.pixabay.com/photo/2015/08/15/10/11/dog-889376_960_720.jpg'
img3 = 'https://cdn.pixabay.com/photo/2014/12/10/05/50/english-bulldog-562723_960_720.jpg'
img4 = 'https://cdn.pixabay.com/photo/2015/02/21/10/39/dog-644111_960_720.jpg'
img5 = 'https://cdn.pixabay.com/photo/2019/07/30/05/53/dog-4372036_960_720.jpg'
img6 = 'https://cdn.pixabay.com/photo/2020/11/12/13/44/labrador-retriever-5735582_960_720.jpg'
img7 = 'https://cdn.pixabay.com/photo/2016/02/18/18/37/puppy-1207816_960_720.jpg'

img_arr = [ img1, img2, img3, img4, img5, img6, img7]


20.times {

  # file = File.new(Rails.root.join('app/assets/images/seed/' + img_dogs.sample + '.jpg'))


  art = Article.create( title: Faker::Lorem.sentence, 
                        text: 
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
                        Phasellus vulputate sed elit condimentum sodales. Cras tellus dolor,
                        mattis viverra felis ut, accumsan pulvinar nulla. Aliquam elit sapien,
                        aliquam et lobortis vitae, elementum quis justo. Fusce non dui a justo commodo dapibus.
                        Phasellus pretium sed mauris molestie lacinia. Curabitur dapibus varius ultricies.
                        Sed vestibulum, nulla ut facilisis tristique, diam felis facilisis velit, quis tristiqu
                        lacus urna id dolor. Donec varius porta lacus, eget finibus metus imperdiet at.
                        In at neque facilisis magna porta bibendum at at tortor. Fusce lorem quam, condimentum mollis elementum quis,
                        interdum ac orci. Mauris quis ipsum non dui lacinia dignissim. Orci varius natoque penatibus
                        et magnis dis parturient montes, nascetur ridiculus mus.
                        
                        Donec rhoncus feugiat mi eget aliquet. Vestibulum laoreet convallis nisl,
                        id volutpat justo facilisis sit amet. Phasellus finibus libero at lectus aliquam, vitae gravida ex pretium.
                        Mauris nec risus et nibh luctus egestas quis eget est. Sed eget urna nec tortor bibendum finibus. Sed non tincidunt libero,
                        ac finibus enim. Ut urna quam, ultricies sit amet est sit amet, sollicitudin pharetra eros. Ut rutrum mauris quis rutrum molestie. Sed urna
                        lectus, dapibus sit amet lectus at, porttitor consequat libero. Suspendisse rhoncus tristique nibh, at aliquet sapien vulputate nec. 
                        Nullam vulputate est nunc, nec venenatis purus porttitor at. Mauris in neque at diam suscipit aliquam. Nunc consectetur commodo faucibus,',
                        author_id: users.sample, 
                        remote_image_url: img_arr.sample )

  arti << art.id
  4.times {
    art.category_ids = arr_cat.sample
  }
}

vote = Vote.create(user_id: users.sample, article_id: arti.sample)


p Category.count



