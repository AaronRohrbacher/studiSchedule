class School < ApplicationRecord
  has_many :accounts
  has_many :teachers
  has_many :timereports
  has_many :attendances
  has_many :teacherEvents
  has_many :accountevents
  has_many :events
  has_many :times
  has_many :rooms
  has_many :users
end
