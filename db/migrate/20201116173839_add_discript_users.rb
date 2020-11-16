class AddDiscriptUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :discript, :text
  end
end
