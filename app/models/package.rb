class Package < ApplicationRecord
  has_many :categories, through: :packages_and_categories
  has_many :tags, through: :packages_and_tags
  has_one :city
  has_one :prefecture
  belongs_to :user
end
