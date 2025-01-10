class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher
  has_many :requests #, dependent: :destroy_async
  # user.requests -> gets all requests made by the user
  # user.requests.request_status -> gets the status of the request
  # user.requests.where(request_status: Request.request_statuses[:approved]) -> gets all approved requests made by the user
  # user.requests.where(request_status: Request.request_statuses[:rejected]) -> gets all rejected requests made by the user
  # user.requests.where(request_status: Request.request_statuses[:pending]) -> gets all pending requests made by the user
  # user.requests.size -> gets the number of requests made by the user
  has_many :library_users
  has_many :libraries, through: :library_users
  # user.libraries -> gets all libraries created by admin

  validates_presence_of :user_name
  validates_presence_of :email
  validates_presence_of :password
  validates_presence_of :user_role
  validates_uniqueness_of :email

  enum user_role: {reader: 0, librarian: 1, admin: 2}
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :jwt_authenticatable, jwt_revocation_strategy: self
end
