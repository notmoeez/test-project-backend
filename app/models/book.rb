class Book < ApplicationRecord
  belongs_to :library
  # book.library -> gets the library that the book belongs to
  has_many :requests #, dependent: :destroy_async

  # book.requests -> gets all requests made for the book
  # book.requests.request_status -> gets the status of the request
  # book.requests.where(request_status: Request.request_statuses[:approved]) -> gets all approved requests for the book
  # book.requests.where(request_status: Request.request_statuses[:rejected]) -> gets all rejected requests for the book
  # book.requests.where(request_status: Request.request_statuses[:pending]) -> gets all pending requests for the book 
  # book.requests.size -> gets the number of requests made for the book
  # book.requests.empty? -> checks if the book has any requests
  # book.requests.approved.size -> gets the number of approved requests for the book
  # book.requests.rejected.size -> gets the number of rejected requests for the book
  # book.requests.pending.size -> gets the number of pending requests for the book
  validates_presence_of :title, :author_name, :quantity
end
