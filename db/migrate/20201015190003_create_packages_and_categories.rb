class CreatePackagesAndCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :packages_and_categories do |t|
      t.integer :category_id, :null => false
      t.integer :package_id, :null => false
      t.timestamps
    end
  end
end
