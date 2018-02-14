class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :school
  accepts_nested_attributes_for :school
  has_one :account

  delegate :admin, to: :account, prefix: true, allow_nil: true
  delegate :type, to: :account, prefix: true, allow_nil: true
end
