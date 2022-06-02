class AddColumnsToCountries < ActiveRecord::Migration[6.1]
  def change
    add_column :countries, :income_min, :integer
    add_column :countries, :income_max, :integer
    add_column :countries, :tax_min, :float
    add_column :countries, :tax_max, :float
  end
end
