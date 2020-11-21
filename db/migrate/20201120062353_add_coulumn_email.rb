class AddCoulumnEmail < ActiveRecord::Migration[5.2]
  def change
    add_column :photographers, :email, :string,default: "", null: false
  end
end
