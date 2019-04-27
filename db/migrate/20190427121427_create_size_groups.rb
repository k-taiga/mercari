class CreateSizeGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :size_groups do |t|
      t.string :size-group

      t.timestamps
    end
  end
end
