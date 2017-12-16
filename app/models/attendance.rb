class Attendance < ApplicationRecord
  belongs_to :school
  belongs_to :account
end
