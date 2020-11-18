class User < ApplicationRecord
  devise :database_authenticatable, 
         :recoverable, :rememberable, :validatable
  has_many :packages, dependent: :destroy
  accepts_nested_attributes_for  :packages, :allow_destroy  =>  true
end
