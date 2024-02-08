# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
City.destroy_all
Dogsitter.destroy_all
Dog.destroy_all
Stroll.destroy_all
require 'faker'

cities = []
10.times do
  city = City.create(name: Faker::Address.city)
  cities << city
end

10.times do
    dogsitter = Dogsitter.create!(name: Faker::Name.first_name, city_id: cities[rand(0..9)].id)
end

10.times do 
    dog = Dog.create!(name: Faker::Name.first_name, city_id: cities[rand(0..9)].id)
end

30.times do
    strolls = Stroll.create(date: Faker::Time.between_dates(from: Date.today, to: Date.today + 365, period: :day), dog_id: Dog.all.shuffle.last.id, dogsitter_id: Dogsitter.all.shuffle.last.id)
end