class RenamePackageIdPostsAndCategories < ActiveRecord::Migration[5.2]
  def change
    rename_column :posts_and_categories, :package_id, :post_id
  end
end
