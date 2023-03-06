class CreateRestaurants < ActiveRecord::Migration[7.0]
  def change
    create_table :restaurants do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :type
      t.string :adress
      t.integer :phone_number
      t.string :website
      t.string :email

      t.timestamps
    end
  end
end
