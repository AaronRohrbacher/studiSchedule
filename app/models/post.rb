class Post < ApplicationRecord
  belongs_to :board
  belongs_to :account

  has_attached_file :attachment
  do_not_validate_attachment_file_type :attachment
end
