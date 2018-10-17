# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

User.create!(name: "test", password:"testest", password_confirmation: "testest")

50.times do |n|
  name = "user#{n}"
  password = "password"
  User.create!(name: name, password: password)
end

users = User.order(:created_at).take(6)
6.times do |n|
  users.each do |user|
    user.picks.create!(round: n+1, title: "title", name: "name#{n+1}")
  end
end
