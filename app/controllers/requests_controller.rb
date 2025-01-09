class RequestsController < ApplicationController
  before_action :set_request, only: [:show, :update, :destroy]
  def index
    @requests = Request.all
    render json: {data: @requests}
  end

  def new
    @request = Request.new
  end

  def create
    request = Request.new(request_params)
    if request.save
      render json: request, status: :created
    else
      render json: request.errors, status: :unprocessable_entity
    end
  end

  def show
    render json: @request
  end

  private

  def request_params
    params.require(:request).permit(:name, :email, :message)
  end

  def set_request
    @request = Request.find(params[:id])
  end
end