class RenameImageColumnToImages < ActiveRecord::Migration[5.2]
  def change
    rename_column :packages, :image, :images
  end
end
