class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher
  enum user_role: {reader: 0, librarian: 1, admin: 2}
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :jwt_authenticatable, jwt_revocation_strategy: self
end
