class Package < ApplicationRecord
  has_many :packages_and_categories
  has_many :packages_and_tags
end
