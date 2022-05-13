class AddCoastalToCities < ActiveRecord::Migration[6.1]
  def change
    add_column :cities, :coastal, :boolean
  end
end
