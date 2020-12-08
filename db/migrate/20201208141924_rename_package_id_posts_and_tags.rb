class RenamePackageIdPostsAndTags < ActiveRecord::Migration[5.2]
  def change
    rename_column :posts_and_tags, :package_id, :post_id
  end
end
