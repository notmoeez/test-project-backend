class Library < ApplicationRecord
  has_many :books #, dependent: :destroy_async
  # library.books -> gets all books in the library
  has_many :library_users
  has_many :users, through: :library_users
  # library.users -> gets all users in the library
  # library.users.size -> gets the number of users in the library
  # library.users.empty? -> checks if the library has any users
  # library.users.where(user_role: User.user_roles[:reader]) -> gets all readers in the library

  validates_presence_of :name
end
