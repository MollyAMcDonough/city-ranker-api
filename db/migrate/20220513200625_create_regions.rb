class CreateRegions < ActiveRecord::Migration[6.1]
  def change
    create_table :regions do |t|
      t.string :name
      t.string :country
      t.string :political_party
      t.float :tax_min
      t.float :tax_max
      t.integer :income_min
      t.integer :income_max

      t.timestamps
    end
  end
end
