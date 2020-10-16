class Tag < ApplicationRecord
  has_many :packages_and_tags
end
