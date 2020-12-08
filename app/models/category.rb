class Category < ApplicationRecord
  has_many :posts_and_categories
  has_many :posts, through: :posts_and_categories, dependent: :destroy
end
