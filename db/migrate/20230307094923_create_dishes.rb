class CreateDishes < ActiveRecord::Migration[7.0]
  def change
    create_table :dishes do |t|
      t.references :menu, null: false, foreign_key: true
      t.string :name
      t.integer :price
      t.text :description
      t.string :dietary_type
      t.string :category

      t.timestamps
    end
  end
end
