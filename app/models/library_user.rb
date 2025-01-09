class LibraryUser < ApplicationRecord
  belongs_to :user
  belongs_to :library
  validate_presence_of :user_id, :library_id
end
