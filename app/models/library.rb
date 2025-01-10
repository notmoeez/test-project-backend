class Library < ApplicationRecord
  has_many :books
  has_many :library_users
  has_many :users, through: :library_users

  validates_presence_of :name
end
