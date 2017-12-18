class TeacherAccounts < ApplicationRecord
  belongs_to :teacher
  belongs_to :account
end
