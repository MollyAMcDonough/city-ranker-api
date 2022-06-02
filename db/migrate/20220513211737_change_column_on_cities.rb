class ChangeColumnOnCities < ActiveRecord::Migration[6.1]
  def change
    rename_column :cities, :region, :region_id
  end
end
