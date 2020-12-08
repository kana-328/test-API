class City < ApplicationRecord
  belongs_to :prefecture
  has_one :post
end
