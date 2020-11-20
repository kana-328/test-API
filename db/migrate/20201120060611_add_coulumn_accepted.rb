class AddCoulumnAccepted < ActiveRecord::Migration[5.2]
  def change
    add_column :photographers, :accepted, :boolean, default: false, null: false
  end
end
