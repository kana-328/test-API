class ChangeColumnToUser < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :packages, :users
    remove_index :packages, :user_id
    remove_reference :packages, :user
  end
end
