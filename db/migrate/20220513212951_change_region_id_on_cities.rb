class ChangeRegionIdOnCities < ActiveRecord::Migration[6.1]
  def change
    change_column :cities, :region_id, 'bigint USING CAST(region_id AS bigint)', null: false, foreign_key: true
  end
end
