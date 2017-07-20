# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(name:  "King Smyhk",
             email: "compunomics@yahoo.com",
             password:              "foobar123",
             password_confirmation: "foobar123",
             admin:     true,
             activated: true,
             activated_at: Time.zone.now)

99.times do |n|
  name = Faker::Name.name
  email = "test-#{n+1}@example.com"
  password = "password123"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)
end

users = User.order(:created_at).take(6)
5.times do
  title = Faker::Lorem.sentence(1)
  body = Faker::Lorem.paragraph(2)
  users.each { |user| user.articles.create!(title: title, body: body) }
end
