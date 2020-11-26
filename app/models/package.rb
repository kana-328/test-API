class Package < ApplicationRecord
  has_many :packages_and_categories
  has_many :categories, through: :packages_and_categories
  has_many :packages_and_tags
  belongs_to :photographer
  has_one :city
  has_one :prefecture
  mount_uploaders :image, ImageUploader
  validate  :image_size

  private

    # アップロードされた画像のサイズをバリデーションする
    def image_size
      if image.size > 5.megabytes
        errors.add(:image, "should be less than 5MB")
      end
    end
end
