class Item < ApplicationRecord
  has_many :images
  has_many :comments
  belongs_to :user
  belongs_to :category
  belongs_to :brand
  belongs_to :size
  belongs_to :delivery_way
  belongs_to :prefecture
  belongs_to :delivery_date
  belongs_to :sell_status
end
