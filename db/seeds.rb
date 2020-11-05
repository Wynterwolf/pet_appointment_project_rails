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

v1 = Veterinarian.find_or_create_by(name: "Dr. Franknstein", specializations: "Reptile", phone_number: "(123)404-4547")
v2 = Veterinarian.find_or_create_by(name: "Dr. Knowsitall", specializations: "Canine", phone_number: "(123)254-4267")
v3 = Veterinarian.find_or_create_by(name: "Dr. Stein", specializations: "Feline", phone_number: "(123)454-4567")

a1 = v1.appointments.find_or_create_by(
    pet: p1,
    location: "downtown",
    start_time: 2.days.ago,
    end_time: 2.days.ago + 1.hour
)

a2 = v2.appointments.find_or_create_by(
    pet: p2,
    location: "downtown",
    start_time: 1.days.ago,
    end_time: 1.days.ago + 5.hour
)

a3 = v3.appointments.find_or_create_by(
    pet: p3,
    location: "uptown",
    start_time: 7.days.ago,
    end_time: 7.days.ago + 6.hour
)

10.times do
    veterinarian = [v1, v2, v3].sample
    start = [1,2,3,4,5,6].sample.days.ago + [1,2,3,4,5,6,7].sample.hour
    veterinarian.appointments.find_or_create_by(
        pet: [p1, p2, p3].sample,
        start_time: start,
        end_time: start + 1.hour,
        location: ["Uptown", "Downtown", "Oregon", "Arizona"].sample
    )
end
