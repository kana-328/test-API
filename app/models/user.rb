class User < ApplicationRecord
  devise :database_authenticatable, 
         :recoverable, :rememberable, :validatable
  has_many :packages, dependent: :destroy
end
