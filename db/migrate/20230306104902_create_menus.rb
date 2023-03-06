class CreateMenus < ActiveRecord::Migration[7.0]
  def change
    create_table :menus do |t|
      t.references :restaurant, null: false, foreign_key: true
      t.string :menu_name
      t.references :template, null: false, foreign_key: true

      t.timestamps
    end
  end
end
