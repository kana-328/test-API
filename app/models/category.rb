class Category < ApplicationRecord
  has_many :packages_and_categories
end
