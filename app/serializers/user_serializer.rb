class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :email, :followers, :followings
end
