class AddRememberDigestToPhotographers < ActiveRecord::Migration[5.2]
  def change
    add_column :photographers, :remember_digest, :string
  end
end
