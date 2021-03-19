# README

# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname    | string | null: false |
| email    | string | null: false |
| password | string | null: false |
| first_name | string | null: false |
| last_name | string | null: false |
| first_name_kana | string | null: false |
| last_name_lana | string | null: false |
| birth_ day | data | null :false |

### Association

- has_many :items
- has_one :order
- has_one :address

## items　テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| info    | text | null: false |
| category_id | integer | null: false |
| sales_status_id | integer | null: false |
| shipping_fee_status_id | integer | null: false |
| prefecture_id | integer | null: false |
| scheduled_delivery_id | integer | null: false |
| price | integer | null: false |
| user_id | references | foreign_key: true |

### Association

- has_one :order
- belongs_to :user

- has_one_attached :image
- belongs_to_active_hash :category
- belongs_to_active_hash :sales_status
- belongs_to_active_hash :shipping_fee_status
- belongs_to_active_hash :scheduled_delivery
- belongs_to_active_hash :prefecture

## order テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| item_id  | references | null: false, foreign_key: true |
| user_id  | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :address

## address　テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| postal_code     | string | null: false |
| prefecture_id    | integer | null: false |
| city | string | null: false |
| addresses | string | null: false |
| building | string | null: false |
| phone_number | strng | null: false |
| user_id | references | null: false, foreign_key: true |
| order_id | references | null: false, foreign_key: true |

### Association

- belongs_to :order
- belongs_to :user
- belongs_to_active_hash :prefecture

