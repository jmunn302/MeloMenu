class RenamefirstName < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :fist_name, :first_name
  end
end
