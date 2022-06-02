class RemoveCountryFromCities < ActiveRecord::Migration[6.1]
  def change
    remove_column :cities, :country, :string
  end
end
