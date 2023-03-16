# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Deleting db"
Dish.destroy_all
Menu.destroy_all
Template.destroy_all
Restaurant.destroy_all
User.destroy_all

require "open-uri"

User.create!(first_name: 'Anna', last_name: 'Jones', email: Faker::Internet.email, password: Faker::Internet.password(min_length: 8))

@users = User.all
ids = []
@users.each do |user|
  ids << user.id
end

Restaurant.create!(user_id: ids.sample, name: 'Ginos', cuisine: 'Italian', address: 'C. del Dr. Esquerdo 66', phone_number: '+34 912759861', website: 'www.ginos.es', email: 'info@ginos.com')

Restaurant.create!(user_id: ids.sample, name: 'Zen Bamboo', cuisine: 'Chinese', address: 'C. del Dr. Esquerdo 70', phone_number: '+34 914008126', website: 'www.zenbamboo.es', email: 'info@zenbamboo.com')

Restaurant.create!(user_id: ids.sample, name: 'Taco Time', cuisine: 'Mexican', address: 'c. de sta. Isabel 5', phone_number: '+34 427568335', website: 'www.tacotime.es', email: 'info@tacotime.com')


Template.create!(name: "Colourful Template")

Template.create!(name: "Boho Template")

Template.create!(name: "Classic Template")

Template.create!(name: "Cute Cafe Template")

Template.create!(name: "Simple Template")


@templates = Template.all
template_ids = []
@templates.each do |template|
  template_ids << template.id
end

@restaurants = Restaurant.all
restaurant_ids = []
@restaurants.each do |restaurant|
  restaurant_ids << restaurant.id
end

puts "Yay you're done!"
