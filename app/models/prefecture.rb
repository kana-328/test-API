class Prefecture < ApplicationRecord
  has_many :cities
  has_one :package
end
