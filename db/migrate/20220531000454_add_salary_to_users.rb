class AddSalaryToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :salary, :integer
  end
end
