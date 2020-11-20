class AddCoulumnAddress < ActiveRecord::Migration[5.2]
  def change
    add_column :photographers, :address, :string, default: "", null: false
  end
end
