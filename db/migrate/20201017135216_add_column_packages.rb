class AddColumnPackages < ActiveRecord::Migration[5.2]
  def change
    add_column :packages, :image, :string
    add_column :packages, :day, :date
  end
end
