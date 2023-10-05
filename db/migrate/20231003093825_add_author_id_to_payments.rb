class AddAuthorIdToPayments < ActiveRecord::Migration[7.0]
  def change
    add_column :payments, :author_id, :integer
    add_index :payments, :author_id
    add_reference :payments, :users, foreign_key: true
  end
end
