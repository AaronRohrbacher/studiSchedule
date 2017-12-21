class Account < ApplicationRecord
  belongs_to :school
  belongs_to :user
  has_many :posts
  has_many :account_events
  has_one :teacher_account
  has_one :teacher, :through => :teacher_account
  has_many :events, :through => :account_events
  has_many :attendances
end
