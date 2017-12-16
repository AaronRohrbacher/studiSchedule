class AccountEvent < ApplicationRecord
  belongs_to :school
  belongs_to :account
  belong_to :event
end
