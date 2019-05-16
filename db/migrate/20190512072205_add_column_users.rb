class AddColumnUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :family_name_kanji, :string
    add_column :users, :first_name_kanji, :string
    add_column :users, :family_name_kana, :string
    add_column :users, :first_name_kana, :string
    add_column :users, :zip_code, :integer
    add_column :users, :prefecture, :string
    add_column :users, :city, :string
    add_column :users, :address1, :string
    add_column :users, :address2, :string
  end
end
