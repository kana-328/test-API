class ChangePackagesAndCategoriesToPostsAndCategories < ActiveRecord::Migration[5.2]
  def change
    rename_table :packages_and_categories, :posts_and_categories
  end
end
