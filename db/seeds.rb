# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Record.create title: 'Record 1', date: Date.today, amount: 500
Record.create title: 'Record 2', date: Date.today, amount: -100

#  title      :string
#  date       :date
#  amount     :float

50.times do
  Record.create title: Faker::Name.title, date: Faker::Date.between(100.days.ago, Date.today), amount: rand(-500..0)
end

50.times do
  Record.create title: Faker::Name.title, date: Faker::Date.between(100.days.ago, Date.today), amount: rand(0..500)
end