class RenameType < ActiveRecord::Migration[7.0]
  def change
    rename_column :restaurants, :type, :cuisine
  end
end
