class AddPackagesAndCategories < ActiveRecord::Migration[5.2]
  def change
 
  end
  add_foreign_key :packages, :categories
end
