class CreateSupportRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :support_requests do |t|
      t.string :name
      t.text :issue

      t.timestamps
    end
  end
end
