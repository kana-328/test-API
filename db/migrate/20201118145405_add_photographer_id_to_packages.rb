class AddPhotographerIdToPackages < ActiveRecord::Migration[5.2]
  def change
    add_reference :packages, :photographer, foreign_key: true
  end
end
