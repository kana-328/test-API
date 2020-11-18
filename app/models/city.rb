class City < ApplicationRecord
  belongs_to :prefecture
  belongs_to :package
end
