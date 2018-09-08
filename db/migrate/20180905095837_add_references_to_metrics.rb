class AddReferencesToMetrics < ActiveRecord::Migration[5.1]
  def change
    change_table(:metrics) do |t|
      t.references :user, index: true
      t.references :device, index: true
    end
  end
end
