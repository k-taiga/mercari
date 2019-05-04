class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
    t.string     :name,             null:false
    t.text       :info,             null:false
    t.string     :status,           null: false
    t.string     :size,             null: false
    t.string     :delivery_cost,    null: false
    t.string     :prefecture,       null: false
    t.string     :delivery_day,     null: false
    t.integer    :price,            null:false
    t.references :user, null: false, foreign_key: true
    t.timestamps
    end
  end
end
