class Request < ApplicationRecord
  enum request_status: { pending: 0, approved: 1, rejected: 2 }
  validates_presence_of :request_status
  belongs_to :book
  # request.book -> gets the book that the request is for
  # request.book.library -> gets the library that the book belongs to
  belongs_to :user
  # request.user -> gets the user that made the request
end
