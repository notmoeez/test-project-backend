class LibrariesController < ApplicationController
  def index
    @libraries = Library.all
    render json: {data: @libraries}
  end
end