class AddAirportToCities < ActiveRecord::Migration[6.1]
  def change
    add_column :cities, :airport, :string
  end
end
