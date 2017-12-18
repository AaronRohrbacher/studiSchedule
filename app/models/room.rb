class Room < ApplicationRecord
  belongs_to :school
  has_many :schedules
  has_many :events, :through => :schedules
end
