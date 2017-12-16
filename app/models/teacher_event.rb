class TeacherEvent < ApplicationRecord
  belongs_to :school
  belongs_to :account
  belongs_to :event
end
