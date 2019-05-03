class ItemImage < ApplicationRecord
  belongs_to :item, inverse_of: :item_image
  mount_uploader :image, ImageUploader
end
