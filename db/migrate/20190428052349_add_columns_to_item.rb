class AddColumnsToItem < ActiveRecord::Migration[5.0]
  def change
    add_reference :items, :user,            foreign_key: true
    add_reference :items, :image,           foreign_key: true
    add_reference :items, :comment,         foreign_key: true
    add_reference :items, :category,        foreign_key: true
    add_reference :items, :brand,           foreign_key: true
    add_reference :items, :size,            foreign_key: true
    add_reference :items, :sell_status,     foreign_key: true
    add_reference :items, :delivery_way,    foreign_key: true
    add_reference :items, :delivery_date,   foreign_key: true
    add_reference :items, :prefecture,      foreign_key: true
    add_reference :items, :price,           foreign_key: true
  end
end
