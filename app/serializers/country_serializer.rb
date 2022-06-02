class CountrySerializer < ActiveModel::Serializer
  attributes :id, :name, :currency, :language
end
