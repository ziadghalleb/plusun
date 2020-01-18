# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "faker"

for i in 1..12 do
  fake_user1 = Faker::Internet
  faker_user2 = Faker::Name
  faker_user3 = Faker::Gender
  faker_user4 = Faker::GreekPhilosophers
  faker_user5 = Faker::Address
  user = User.new(
    email: fake_user1.email,
    password: "lewagon",
    password_confirmation: "lewagon",
    sexe: faker_user3.binary_type,
    age: rand(20..30),
    photo: (i).to_s,
    description: faker_user4.quote,
    height: rand(160..200),
    alcool: ['A l\'occasion', 'Jamais', 'Régulièrement'].sample,
    tabac: ['A l\'occasion', 'Jamais', 'Régulièrement'].sample,
    address: "not sharing it with you today",
    first_name: faker_user2.first_name
  )
  user.save!

  service = Service.new(
    category: ['Mariage', 'Soirée'].sample,
    name: ['Mariage', 'Soirée'].sample,
    description: "none of your business",
    price_hourly: rand(20..60),
    # price_daily will serve the service pic
    price_daily: (i).to_s,
    user_id: (i).to_i
  )
  service.save!
end
