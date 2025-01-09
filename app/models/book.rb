class Book < ApplicationRecord
  belongs_to :library
  has_many :requests
  validates_presence_of :title, :author_name, :quantity
end
