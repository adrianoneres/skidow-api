class UserSerializer < ActiveModel::Serializer
  attributes :name, :email

  has_one :account
end
