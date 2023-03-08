# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Deleting db"

require "open-uri"

User.create!(first_name: 'John', last_name: 'Doe', email: Faker::Internet.email, password: Faker::Internet.password(min_length: 8))

User.create!(first_name: 'Alice', last_name: 'Smith', email: Faker::Internet.email, password: Faker::Internet.password(min_length: 8))

User.create!(first_name: 'Paul', last_name: 'Baker', email: Faker::Internet.email, password: Faker::Internet.password(min_length: 8))

User.create!(first_name: 'Anna', last_name: 'Jones', email: Faker::Internet.email, password: Faker::Internet.password(min_length: 8))

@users = User.all
ids = []
@users.each do |user|
  ids << user.id
end

Restaurant.create!(user_id: ids.sample, name: 'Pizza Palace', cuisine: 'Italian', address: '123 Main St', phone_number: '5551234', website: 'https://pizzapalace.com', email: 'info@pizzapalace.com')

Restaurant.create!(user_id: ids.sample, name: 'Sushi World', cuisine: 'Japanese', address: '456 Oak Ave', phone_number: '15655678', website: 'https://sushiworld.com', email: 'info@sushiworld.com')

Restaurant.create!(user_id: ids.sample, name: 'Taco Time', cuisine: 'Mexican', address: '789 Elm St', phone_number: '4275683', website: 'https://tacotime.com', email: 'info@pizzapalace.com')

Restaurant.create!(user_id: ids.sample, name: 'Burger Joint', cuisine: 'American', address: '1010 Maple Ave', phone_number: '69841940', website: 'https://sushiworld.com', email: 'info@sushiworld.com')

Template.create!(name: "Colourful Template")

Template.create!(name: "Classic Template")

Template.create!(name: "Modern Template")

Template.create!(name: "Special Template")

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

Menu.create!(menu_name: "Dinner Menu", restaurant_id: restaurant_ids.sample, template_id: template_ids.sample)

Menu.create!(menu_name: "Lunch Menu", restaurant_id: restaurant_ids.sample, template_id: template_ids.sample)

Menu.create!(menu_name: "Summer Menu", restaurant_id: restaurant_ids.sample, template_id: template_ids.sample)

Menu.create!(menu_name: "Classic Menu", restaurant_id: restaurant_ids.sample, template_id: template_ids.sample)

puts "Yay you're done!"
