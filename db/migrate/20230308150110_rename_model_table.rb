class RenameModelTable < ActiveRecord::Migration[7.0]
  def change
    rename_table :support_requests, :support
  end
end
