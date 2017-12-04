class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :name, :stack, :role, :label
end
