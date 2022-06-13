class UserCitySerializer < ActiveModel::Serializer
  attributes :id, :note
  has_one :category
  has_one :city
  has_one :region
end
