# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

School.create!(name:'Epicodus')

User.create!(email: 'admin@admin.com', password: '111111', school_id: 1)

Account.create!(user_id: 1, school_id: 1, admin: true)
