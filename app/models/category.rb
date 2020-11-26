class Category < ApplicationRecord
  has_many :packages_and_categories
  has_many :packages, through: :packages_and_categories
end
