# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user_array = []
question_array = []
answer_array = []

1000.times do
  u =   User.new(real_name:  Faker::Name.name,
                  email:          Faker::Internet.email,
                  user_name:      Faker::Internet.user_name,
                  password:       "pass",
                  about:          Faker::Lorem.sentence,
                  age:            rand(70)+18,
                  website:        Faker::Internet.url,
                  location:       Faker::Address.city)
  user_array << u

  (rand(4)+1).times do
    q = u.questions.build(title: Faker::Lorem.word,
                          content: Faker::Lorem.paragraph)

    question_array << q
  end
  u.save
end

question_array.each do |question|
  (rand(2)+1).times do
    a = question.answers.build(content: Faker::Lorem.paragraph)
    a.user = user_array.sample
    a.save
    answer_array << a

    c = question.comments.build(content: Faker::Lorem.paragraph)
    c.user = user_array.sample
    c.save
  end
end

answer_array.each do |answer|
  c = answer.comments.build(content: Faker::Lorem.paragraph)
  c.user = user_array.sample
  c.save
end



