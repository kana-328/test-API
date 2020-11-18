class CreatePhotographers < ActiveRecord::Migration[5.2]
  def change
    create_table :photographers do |t|
      t.string :name
      t.text :descript

      t.timestamps
    end
  end
end
