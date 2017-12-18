class Teacher < ApplicationRecord
  belongs_to :school
  has_many :timereports
  has_many :teacher_events
  has_many :teacher_accounts
  has_one :account, :through => :teacher_accounts
  has_many :events, :through => :teacher_events
end
