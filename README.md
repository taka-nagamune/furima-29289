# テーブル設計

## users テーブル

|Column|Type|Options|
|:---:|:---:|:---:|
|name|string|null: false|
|email|string|null: false|
|password|string|null:false|

### Association

- has_many :products
- has_many :purchase_contents
- has_one :profile


## productsテーブル

|Column|Type|Option|
|:---:|:---:|:---:|
|name|string|null: false|
|image|text|null: false|
|content|text|null: false|
|condition_id|references|null: false, foreign_key: true|
|shipping_charge_id|references|null: false, foreign_key: true|
|shipping_region_id|references|null: false, foreign_key: true|
|shipping_date_id|references|null: false, foreign_key: true|
|category_id|references|null: false, foreign_key: true|
|user_id|references|null: false, foreign_key: true|

### Association

- belongs_to :user
- has_one :purchase_content
- has_one :order

## purchase_contentsテーブル

|Column|Type|Option|
|:---:|:---:|:---:|
|postal_code|string|null: false|
|prefecture_id|integer|null: false, foreign_key: true|
|city|text|null: false|
|address|text|null: false|
|building_name|text|null: false|
|call_number|string|null: false|
|user_id|integer|null: false, foreign_key: true|
|product_id|integer|null: false, foreign_key: true|

### Association

- belongs_to :product
- belongs_to :user
- has_one :order

## profilesテーブル

|Column|Type|Option|
|:---:|:---:|:---:|
|first_name|string|null: false|
|last_name|string|null: false|
|user_id|integer|null: false, foreign_key: true|
|year_id|integer|null: false, foreign_key: true|
|month_id|integer|null: false, foreign_key: true|
|date_id|integer|null: false, foreign_key: true|

### Association

- belongs_to :user

## ordersテーブル
|Column|Type|Option|
|:---:|:---:|:---:|
|price|integer|null: false|
|product_id|integer|null: false, foreign_key: true|

### Association

- belongs_to :product