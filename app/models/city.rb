class City < ApplicationRecord
  belongs_to :prefecture
  has_one :package
end
