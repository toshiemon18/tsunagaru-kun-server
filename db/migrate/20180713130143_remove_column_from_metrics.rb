class RemoveColumnFromMetrics < ActiveRecord::Migration[5.1]
  def change
    remove_column :metrics, :name
    remove_column :metrics, :category
    remove_column :metrics, :image
  end
end
