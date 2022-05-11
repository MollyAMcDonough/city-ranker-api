class CreateUserCities < ActiveRecord::Migration[6.1]
  def change
    create_table :user_cities do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :category, null: false, foreign_key: true
      t.belongs_to :city, null: false, foreign_key: true
      t.text :note
      t.float :distance_from
      t.integer :postalcode
      t.string :city
      t.timestamps
    end
  end
end
