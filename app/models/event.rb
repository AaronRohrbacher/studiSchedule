class Event < ApplicationRecord
  belongs_to :school
  has_one :board
  has_many :teacher_events
  has_many :account_events
  has_many :schedules
  has_many :accounts, :through => :account_events
  has_many :teachers, :through => :teacher_events
  has_many :rooms, :through => :schedules
end
