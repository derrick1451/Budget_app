class AddAuthorIdToGroups < ActiveRecord::Migration[7.0]
  def change
    add_column :groups, :author_id, :integer
    add_index :groups, :author_id
    add_reference :groups, :users, foreign_key: true
  end
end
