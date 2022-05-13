class RegionSerializer < ActiveModel::Serializer
  attributes :id, :name, :country, :political_party, :tax_min, :tax_max, :income_min, :income_max
end
