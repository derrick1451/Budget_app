class RemoveUserId < ActiveRecord::Migration[7.0]
  def change
    remove_column :groups, :users_id
    remove_column :payments, :users_id
  end
end
