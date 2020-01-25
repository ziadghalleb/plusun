# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "faker"

FIRSTNAME = ["Paul", "Antoine", "Ines", "Claire", "Lucie", "Charlotte", "Pierre", "Lisa", "Clementine", "Greg", "Margerite", "Mathilde"]
SEXE = ['Homme', 'Homme', 'Femme', 'Femme', 'Femme', 'Femme', 'Homme', 'Femme', 'Femme', 'Homme', 'Femme', 'Homme']
TAILLE = [180, 194, 155, 164, 185, 175, 182, 180, 178, 176, 163, 184]
DESCRIPTION = ["", "", "", "Passionnée de lecture et d'art je propose régulièrement à des personnes agées des visites sur différents sujets", "Jeune, dynamique et très curieuse, j'aime rencontrer de nouvelles personnes, faire la fête et danser jusqu'au bout de la nuit !", "", "", "", "", "", "", ""]


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
    sexe: SEXE[i-1],
    age: rand(20..30),
    photo: (i).to_s,
    description: DESCRIPTION[i-1],
    height: TAILLE[i-1],
    alcool: ['A l\'occasion', 'Jamais', 'Régulièrement'].sample,
    tabac: ['A l\'occasion', 'Jamais', 'Régulièrement'].sample,
    address: "not sharing it with you today",
    first_name: FIRSTNAME[i-1]
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


  Availability.create(start_date: "2020-01-20 12:00", end_date: "2020-01-25 12:00", user_id: 4)
  Availability.create(start_date: "2020-01-30 12:00", end_date: "2020-02-25 12:00", user_id: 4)
  Availability.create(start_date: "2020-01-25 12:00", end_date: "2020-01-30 12:00", user_id: 5)
  Availability.create(start_date: "2020-02-04 12:00", end_date: "2020-02-12 12:00", user_id: 5)
  Availability.create(start_date: "2020-02-20 12:00", end_date: "2020-03-30 12:00", user_id: 5)




end
