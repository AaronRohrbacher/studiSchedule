class School < ApplicationRecord
  has_many :students
  has_many :teachers
  has_many :accounts
  has_many :timereports
  has_many :attendances
  has_many :teacherEvents
  has_many :accountevents
  has_many :events
  has_many :times
  has_many :rooms
  has_many :users

  has_attached_file :logo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
end
