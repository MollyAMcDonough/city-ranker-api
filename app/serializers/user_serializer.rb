class UserSerializer < ActiveModel::Serializer
  attributes :id, :sub
  has_one :city
end
