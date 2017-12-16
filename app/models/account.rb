class Account < ApplicationRecord
  belongs_to :school
  belongs_to :user
  has_many :account_events
  has_many :events, :through => :account_events
  has_many :attendances
end
