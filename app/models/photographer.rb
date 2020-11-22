class Photographer < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
  validates_acceptance_of :accepted, allow_nil: false, on: :create
end
