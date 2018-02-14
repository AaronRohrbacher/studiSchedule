class Event < ApplicationRecord
  belongs_to :school
  has_one :board
  has_many :schedules, dependent: :destroy
  has_many :event_students
  has_many :students, :through => :event_students
  has_many :event_teachers
  has_many :teachers, :through => :event_teachers
  has_many :rooms, :through => :schedules

  # delegate :name, to: :school, prefix: true, allow_nil: true
end
