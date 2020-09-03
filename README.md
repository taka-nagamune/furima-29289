# テーブル設計

## users テーブル

|Column|Type|Options|
|:---:|:---:|:---:|
|name|string|null: false|
|email|string|null: false|
|password|string|null:false|
|first_name|string|null: false|
|last_name|string|null: false|
|first_name_kana|string|null: false|
|last_name_kana|string|null: false|
|birthday|date|null: false|

### Association

- has_many :products
- has_many :orders


## productsテーブル

|Column|Type|Option|
|:---:|:---:|:---:|
|name|string|null: false|
|content|text|null: false|
|price|integer|null: false|
|condition_id|integer|null: false|
|shipping_charge_id|integer|null: false|
|shipping_region_id|integer|null: false|
|shipping_date_id|integer|null: false|
|category_id|integer|null: false|
|user_id|references|null: false, foreign_key: true|

### Association

- belongs_to :user
- has_one :order

## addressesテーブル

|Column|Type|Option|
|:---:|:---:|:---:|
|postal_code|string|null: false|
|prefecture_id|integer|null: false|
|city|text|null: false|
|address|string|null: false|
|building_name|string|
|call_number|string|null: false|
|order_id|string|

### Association

- belongs_to :order


## ordersテーブル
|Column|Type|Option|
|:---:|:---:|:---:|
|product_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|

### Association

- has_one :address
- belongs_to :product
- belongs_to :user