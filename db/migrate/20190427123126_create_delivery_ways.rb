class CreateDeliveryWays < ActiveRecord::Migration[5.0]
  def change
    create_table :delivery_ways do |t|

      t.timestamps
    end
  end
end
