class ChangeColumnToPackage < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :photographers, :users
    remove_index :photographers, :user_id
    remove_reference :photographers, :user
  end
end
