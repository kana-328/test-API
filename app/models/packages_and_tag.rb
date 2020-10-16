class PackagesAndTag < ApplicationRecord
  belongs_to :package
  belongs_to :tag
end
