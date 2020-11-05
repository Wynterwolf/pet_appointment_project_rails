# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.first_or_create(email: "test@test.com", password: "password", phone_number: "(123)454-4567")

p1 = user.pets.find_or_create_by(name: "Samantha")
p2 = user.pets.find_or_create_by(name: "Dean")
p3 = user.pets.find_or_create_by(name: "Adran")

v1 = Veterinarian.find_or_create_by(name: "Dr. Franknstein")
v2 = Veterinarian.find_or_create_by(name: "Dr. Knowsitall", specializations: "Canine")
v3 = Veterinarian.find_or_create_by(name: "Dr. Stein", specializations: "Feline", phone_number: "(123)454-4567")

a1 = 
