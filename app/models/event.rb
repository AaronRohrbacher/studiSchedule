class Event < ApplicationRecord
  belongs_to :school
  has_many :teacher_events
  has_many :account_events
  has many :times
  has_many :accounts :through => :account_events
  has many :teachers :through => :teacher_events
  has many :rooms :through => :times
end
