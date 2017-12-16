class Teacher < ApplicationRecord
  belongs_to :school
  has_many :teacher_events
  has_many :events, :through => :teacher_events
  has_many :timereports
end
