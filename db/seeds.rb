# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

School.create!(name:'Epicodus')

User.create!(email: 'admin@admin.com', password: '111111', school_id: 1)
Account.create!(first_name: 'Admin', last_name: 'McGoo', user_id: 1, school_id: 1, admin: true)

User.create!(email: 'teacher@teacher.com', password:'111111', school_id: 1)
account = Account.create!(first_name: 'Teacher', last_name: 'McFoo', user_id: 2, school_id: 1, admin: false, is_teacher: true)
teacher = Teacher.create!(first_name: account.first_name, last_name: account.last_name, school_id:1)
TeacherAccount.create!(account_id: account.id, teacher_id: teacher.id)


User.create!(email: 'student@student.com', password:'111111', school_id: 1)
Account.create!(first_name: 'Student', last_name: 'McBar', user_id: 3, school_id: 1, admin: false)

5.times do
  Room.create!(name: Faker::RickAndMorty.location, room_number: Faker::Number.number(3), school_id: 1)
end


5.times do
  event = Event.create!(name: Faker::RickAndMorty.character, description: Faker::RickAndMorty.quote, event_type: 'class', school_id:1)
  Board.create!(event_id: event.id)

end
