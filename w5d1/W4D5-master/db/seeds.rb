# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.destroy_all
Sub.destroy_all
Post.destroy_all

User.create!(username: "app", password: "app123")
10.times { User.create!(username: Faker::GameOfThrones.character, password: "app123") }
first_user = User.first.id
last_user = User.last.id
rand_user = (first_user..last_user).to_a

10.times { Sub.create!(title: Faker::Food.ingredient,
            description: Faker::Hipster.sentence,
            user_id: rand_user.sample)
         }

first_sub = Sub.first.id
last_sub = Sub.last.id
rand_sub = (first_sub..last_sub).to_a

# debugger
20.times { Post.create!(title: Faker::Pokemon.name,
            user_id: rand_user.sample,
            sub_ids: rand_sub.take(rand(1..10)))
          }
#
# first_post = Post.first.id
# last_post = Post.last.id
# rand_post = (first_post..last_post).to_a
#
# 20.times { Post_sub.create!(
#             sub_id: rand_sub.sample,
#             post_id: rand_post.sample)
#           }
