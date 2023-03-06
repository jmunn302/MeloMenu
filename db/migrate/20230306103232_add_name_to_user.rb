class AddNameToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :fist_name, :string
    add_column :users, :last_name, :string
  end
end
