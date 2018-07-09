class AddDeviceToDeviceColumn < ActiveRecord::Migration[5.1]
  def change
    add_column :devices, :name, :text
    add_column :devices, :category, :text
    add_column :devices, :image, :text
  end
end
