class Teacher < ApplicationRecord
  belongs_to :school
  has_many :timereports
  has_many :teacher_events
  has_one :teacher_account
  has_one :account, :through => :teacher_account
  has_many :events, :through => :teacher_events
end
