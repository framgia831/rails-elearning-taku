# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

User.create(
  name: "Taku",
  email: "taku@email.com",
  password: "password",
  admin: true
  )

50.times do
  User.create(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: "password"
    )
end

users = User.all
user = User.first
followers = users[2..50]
following = users[3..40]

followers.each { |follower| follower.follow(user) }
following.each { |followed| user.follow(followed) }

10.times do

  Category.create(
    title: Faker::Lorem.word,
    description: Faker::Lorem.sentence(4)
    )
end

categories = Category.all

categories.each do |category|
  10.times do
    content = Faker::Lorem.unique.word
    word = category.words.build(content: content)

    nth = rand(0..2)

    3.times do |i|
      if i == nth
        word.word_answers.build(content: content, correct: true)
      else
        word.word_answers.build(content: Faker::Lorem.word)
      end
    end

    word.save
  end
end