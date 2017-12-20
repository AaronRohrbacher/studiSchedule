class Board < ApplicationRecord
  belongs_to :event
  has_many :posts
end
