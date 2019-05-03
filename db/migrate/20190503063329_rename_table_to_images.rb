class RenameTableToImages < ActiveRecord::Migration[5.0]
  def change
     rename_table :images, :item_images
  end
end
