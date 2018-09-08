class AddMetricsReferenceToDevice < ActiveRecord::Migration[5.1]
  def change
    change_table(:devices) do |t|
      t.references :metrics, index: true
    end
  end
end
