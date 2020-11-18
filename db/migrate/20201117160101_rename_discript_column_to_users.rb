class RenameDiscriptColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :discript, :descript
  end
end
