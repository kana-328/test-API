class Prefecture < ApplicationRecord
  has_many :cities, dependent: :destroy
  has_one :package
end
