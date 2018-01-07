# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


335.times do
  a = (Faker::Book.author).split(' ')
  if a.length < 3
    Author.create([{
                     first_name: a[0],
                     last_name: a[1],
                     birth_year: rand(1850..1990),
                     is_alive: [true, false].sample
                   }])
  end
end