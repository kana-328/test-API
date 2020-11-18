class AddPhotographerIdToPackage < ActiveRecord::Migration[5.2]
  def change
    add_reference :photographers, :user, foreign_key: true
  end
end
