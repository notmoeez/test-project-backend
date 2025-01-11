class BooksController < ApplicationController
  def index
    @books = Book.all
    render json: {data: @books}
    # test commit
  end
end