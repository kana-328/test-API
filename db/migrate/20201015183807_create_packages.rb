class CreatePackages < ActiveRecord::Migration[5.2]
  def change
    create_table :packages do |t|
      t.string :title, :null => false
      t.text :descript, :null => false
      t.integer :price, :null => false
      t.timestamps
    end
  end
end
