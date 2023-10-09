class AddRefToAuthorId < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :payments, :users, column: :author_id
  end
end
