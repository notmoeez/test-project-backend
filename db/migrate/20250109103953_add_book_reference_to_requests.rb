class AddBookReferenceToRequests < ActiveRecord::Migration[7.1]
  def change
    add_reference :requests, :book, null: false, foreign_key: true
  end
end
