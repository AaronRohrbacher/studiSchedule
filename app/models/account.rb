class Account < ApplicationRecord
  belongs_to :school
  belongs_to :user
  has_many :posts
  has_many :attendances
end
