class Package < ApplicationRecord
  include AlgoliaSearch

  has_many :packages_and_categories
  has_many :categories, through: :packages_and_categories, dependent: :destroy
  has_many :packages_and_tags
  belongs_to :photographer
  belongs_to :city
  belongs_to :prefecture
  mount_uploaders :images, ImageUploader
  serialize :images, JSON
  validate  :image_size
  validates :price, numericality: { only_integer: true }


  algoliasearch do
    attribute :title, :prefecture, :city, :photographer_id
    searchableAttributes %w[title prefecture city photographer_id]
  end
  private

    # アップロードされた画像のサイズをバリデーションする
    def image_size
      if images.size > 5.megabytes
        errors.add(:images, "should be less than 5MB")
      end
    end
end
