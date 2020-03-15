class AddManagerIdToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :manager_id, :integer
  end
end
