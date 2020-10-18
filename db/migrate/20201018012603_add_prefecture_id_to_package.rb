class AddPrefectureIdToPackage < ActiveRecord::Migration[5.2]
  def change
    add_column :packages, :city_id, :integer
    add_column :packages, :prefecture_id, :integer
  end
end
