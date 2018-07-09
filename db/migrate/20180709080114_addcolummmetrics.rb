class Addcolummmetrics < ActiveRecord::Migration[5.1]
  def change
    add_column :metrics, :electric_current, :integer
    add_column :metrics, :voltage, :integer
    add_column :metrics, :watt, :integer
    add_column :metrics, :watt_hour, :integer
  end
end
