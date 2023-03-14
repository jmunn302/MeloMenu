class AddQrCodeToMenu < ActiveRecord::Migration[7.0]
  def change
    add_column :menus, :qr_code, :string
  end
end
