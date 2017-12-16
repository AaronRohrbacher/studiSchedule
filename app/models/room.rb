class Room < ApplicationRecord
  belongs_to :school
  has_many :times
  has_many :events :through => :times
end
