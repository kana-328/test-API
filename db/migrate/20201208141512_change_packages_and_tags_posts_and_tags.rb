class ChangePackagesAndTagsPostsAndTags < ActiveRecord::Migration[5.2]
  def change
    rename_table :packages_and_tags, :posts_and_tags
  end
end
