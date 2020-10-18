class PackagesAndCategory < ApplicationRecord
  belongs_to :package
  belongs_to :category
end
