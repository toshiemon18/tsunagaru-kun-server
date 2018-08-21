class AddUserToDevice < ActiveRecord::Migration[5.1]
  def change
    change_table(:devices) do |t|
      t.references :user, index: true
    end
  end
end
