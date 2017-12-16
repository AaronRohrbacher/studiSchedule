class Time < ApplicationRecord
  belongs_to :school
  belongs_to :event
  belongs_to :room
end
