class ChangePriceToFloat < ActiveRecord::Migration[7.0]
  def change
    change_column :dishes, :price, :float
  end
end
