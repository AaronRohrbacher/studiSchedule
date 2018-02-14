class EventTeacher < ApplicationRecord
  belongs_to :school
  belongs_to :teacher
  belongs_to :event
end
