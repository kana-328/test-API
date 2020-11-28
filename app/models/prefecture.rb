class Prefecture < ApplicationRecord
  has_many :cities
  has_many :packages
end
