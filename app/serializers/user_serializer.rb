class UserSerializer
  include JSONAPI::Serializer
  attributes :id, :email, :user_name, :user_role
end
