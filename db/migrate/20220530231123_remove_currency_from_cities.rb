class RemoveCurrencyFromCities < ActiveRecord::Migration[6.1]
  def change
    remove_column :cities, :currency, :string
  end
end
