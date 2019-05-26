# README

## DB構成

## user
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|telephone|integer|null: false, unique: true|
|email|string|null: false|
|password|string|null: false|
|birth_year|integer|null: false|
|birth_month|integer|null: false|
|birth_day|integer|null: false|
|icon_picture|string|
|profile|text|
|background_image|string|
|point|integer|
|uid|integer|
|provider|integer|
|family_name_kanji|string|null: false|
|first_name_kanji|string|null: false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|zip_code|integer|
|prefecture|string|
|city|string|
|address1|string|
|address2|string|

## Association
* has_many :user_evalutions
* has_many :evalutions, through: :user_evalutions
* has_one :credit
* has_many :sns_credentials

## user_evaluation
|Column|Type|Options|
|------|----|-------|
|user_id|references|foreign_key|
|evaluation_id|references|foreign_key|

## Association
* has_many :users
* has_many :evaluations

## evaluation
|Column|Type|Options|
|------|----|-------|
|value|string|null: false|

## Association
* has_many :user_evalutaions
* has_many :users, through: :user_evaluations

## sns_credential
|Column|Type|Options|
|------|----|-------|
|uid|string|
|provider|string|
|user_id|references|foreign_key|

## Association
* belongs_to :user

## credit
|Column|Type|Options|
|------|----|-------|
|customer_id|references|null: false|
|card_id|references|null: false|
|user_id|references|foreign_key|

## Association
* belongs_to :user

## comment
|Column|Type|Options|
|------|----|-------|
|user_id|references|foreign_key|
|text|text|null: false|
|product_id|references|foreign_key|

## Association
* belongs_to :user
* belongs_to :product

## items
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|info|text|null: false|
|category_id|references|null: false, foreign_key|
|brand_id|references|optional: true, foreign_key|
|size|string|null: false|
|status|string|null: false|
|price|integer|null: false|
|delivery_cost|string|null: false|
|precfecture|integer|null: false|
|delivery_date|string|null: false|
|user_id|references|null: false, foreign_key|

## Association
* belongs_to :user
* belongs_to :category
* belongs_to :brand
* has_many: item_images

## item_image
|Column|Type|Options|
|------|----|-------|
|item_id|references|foreign_key|
|image|string|

## Association
* belongs_to :item

## category
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string|index: true|

## Association
* has_many :items
* has_ancestry

## brand
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

## Association
* has_many :items


