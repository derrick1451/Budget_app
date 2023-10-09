class ModifyForeignKeys < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :group_payments, :payments
    remove_foreign_key :group_payments, :groups
    add_foreign_key :group_payments, :payments, on_delete: :cascade
    add_foreign_key :group_payments, :groups, on_delete: :cascade
  end
end
