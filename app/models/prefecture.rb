class Prefecture < ApplicationRecord
  has_many :cities
  belongs_to :package
end
