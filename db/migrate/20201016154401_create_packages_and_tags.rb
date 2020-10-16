class CreatePackagesAndTags < ActiveRecord::Migration[5.2]
  def change
    create_table :packages_and_tags do |t|
      t.integer :package_id, :null => false
      t.integer :tag_id, :null => false
      t.timestamps
    end
  end
end
