class Package < ApplicationRecord
  has_many :packages_and_categories
  has_many :packages_and_tags
  belongs_to :photographer
  has_one :city
  has_one :prefecture
end
