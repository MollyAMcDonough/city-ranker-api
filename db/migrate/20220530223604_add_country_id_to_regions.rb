class AddCountryIdToRegions < ActiveRecord::Migration[6.1]
  def change
    add_reference :regions, :country, null: false, foreign_key: true, default: 1
  end
end
