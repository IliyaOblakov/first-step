# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Message.destroy_all
Chatroom.destroy_all
Booking.destroy_all
User.destroy_all

puts 'Creating some guides'
User.create(email: "iliyaoblakov@gmail.com", password: "123456", first_name: "Iliya", last_name: "Oblakov", location: "Walthamstow, London", is_guide: true)
User.create(email: "bengnmurphy@gmail.com", password: "123456", first_name: "Ben", last_name: "Murphy", location: "Shoreditch, London", is_guide: false)
puts 'Guides are created'

puts 'Creating some Seekers'

User.create(email: "kunalfromcbr@outlook.com", password: "123456", first_name: "Kunal", last_name: "Kumar", location: "Shoreditch, London", is_guide: false)
User.create(email: "clairelesko34@gmail.com", password: "123456", first_name: "Melissa", last_name: "Tardivel", location: "Shoreditch, London", is_guide: false)

puts 'seekers created'
