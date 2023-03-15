class ChangePhoneNumber < ActiveRecord::Migration[7.0]
  def change
    change_column :restaurants, :phone_number, :string
  end
end
