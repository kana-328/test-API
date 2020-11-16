class User < ApplicationRecord
  has_many :packages, dependent: :destroy
end
