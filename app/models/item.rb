class Item < ApplicationRecord
  belongs_to :user
  belongs_to :brand, optional: true
  belongs_to :category
  has_many :item_images, inverse_of: :item
  # category,brandが変更されたらそのテーブルも更新
  accepts_nested_attributes_for :category
  accepts_nested_attributes_for :brand
  # itemレコードが削除されたらそのimageも削除
  accepts_nested_attributes_for :image, allow_destroy: true
end
