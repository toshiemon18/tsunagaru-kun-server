class AddReferencesToMetrics < ActiveRecord::Migration[5.1]
  def change
    change_table(:metrics) do |t|
      t.references :users, index: true
      t.references :devices, index: true
    end
  end
end
