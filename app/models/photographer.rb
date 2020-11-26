class Photographer < ApplicationRecord
  has_many :packages, dependent: :destroy
  validates :name, presence: true
  validates :email, presence: true
  validates_acceptance_of :accepted, allow_nil: false, on: :create
end
