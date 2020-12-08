class ChangePackagesToPosts < ActiveRecord::Migration[5.2]
  def change
    rename_table :packages, :posts
  end
end
