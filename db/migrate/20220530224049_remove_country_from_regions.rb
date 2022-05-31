class RemoveCountryFromRegions < ActiveRecord::Migration[6.1]
  def change
    remove_column :regions, :country, :string
  end
end
