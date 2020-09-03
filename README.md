# テーブル設計

## users テーブル

|Column|Type|Options|
|:---:|:---:|:---:|
|name|string|null: false|
|email|string|null: false|
|password|string|null:false|
|first_name|string|null: false|
|last_name|string|null: false|
|date|string|

### Association

- has_many :products
- has_many :purchase_contents
- has_one :profile
- has_many :orders


## productsテーブル

|Column|Type|Option|
|:---:|:---:|:---:|
|name|string|null: false|
|content|text|null: false|
|price|integer|null: false|
|condition_id|references|null: false|
|shipping_charge_id|references|null: false|
|shipping_region_id|references|null: false|
|shipping_date_id|references|null: false|
|category_id|references|null: false|
|user_id|references|null: false, foreign_key: true|

### Association

- belongs_to :user
- has_one :purchase_content
- has_one :order

## purchase_contentsテーブル

|Column|Type|Option|
|:---:|:---:|:---:|
|postal_code|string|null: false|
|prefecture_id|integer|null: false|
|city|text|null: false|
|address|string|null: false|
|building_name|string|
|call_number|string|null: false|
|user_id|integer|null: false, foreign_key: true|
|product_id|integer|null: false, foreign_key: true|

### Association

- belongs_to :product
- belongs_to :user
- has_one :order


## ordersテーブル
|Column|Type|Option|
|:---:|:---:|:---:|
|product_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|

### Association

- belongs_to :product
- belongs_to :user