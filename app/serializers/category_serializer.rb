class CategorySerializer < ActiveModel::Serializer
  attributes :id, :description, :name, :num_cities
  def num_cities
    Category.cities.length
  end
end
