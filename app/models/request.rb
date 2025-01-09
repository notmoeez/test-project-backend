class Request < ApplicationRecord
  enum request_status: { pending: 0, approved: 1, rejected: 2 }
  validates_presence_of :request_status
  belongs_to :book
end
