# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


500.times do
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

50.times do
  b = (Faker::Name.unique.name).split(' ')
  User.create([{
                first_name: b[0],
                last_name: b[1],
                street_number: Faker::Address.building_number,
                street: Faker::Address.street_name,
                city: Faker::Address.city,
                state: Faker::Address.state_abbr,
                zip_code: Faker::Address.zip_code,
                phone_number: Faker::PhoneNumber.cell_phone,
                company: Faker::Company.name,
                email: Faker::Internet.unique.email,
                password: '123456',
                password_confirmation: '123456',
                is_superadmin: false
               }])
end