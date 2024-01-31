# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | -----------               |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| family_name        | string | null: false               |
| first_name         | string | null: false               |
| family_name_kana   | string | null: false               |
| first_name_kana    | string | null: false               |
| birth_year         | string | null: false               |
| birth_month        | string | null: false               |
| birth_day          | string | null: false               |


### Association

- has_many :items
- has_many :order_histories

## items テーブル

| Column             | Type       | Options                        |
| ------             | ------     | -----------                    |
| name               | string     | null: false                    |
| description        | text       | null: false                    |
| category_id        | integer    | null: false, foreign_key: true |
| brand_id           | integer    | null: false, foreign_key: true |
| status_id          | integer    | null: false, foreign_key: true |
| seller_user_id     | integer    | null: false, foreign_key: true |
| shipping_cost      | string     | null: false                    |
| shipping_lead_time | string     | null: false                    |
| price              | string     | null: false                    |
| prefecture_id      | integer    | null: false, foreign_key: true |
| image              | string     | null: false                    |

### Association

- belongs_to :user
- has_one :order history

## order_histories テーブル

| Column        | Type       | Options                        |
| -------       | ---------- | ------------------------------ |
| buyer_user_id | integer    | null: false, foreign_key: true |
| item_id       | integer    | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_one :item
- has_one :destination

## destinations テーブル

| Column             | Type    | Options                         |
| ------------------ | ------  | -----------                     |
| zip_code           | string  | null: false                     |
| family_name        | string  | null: false                     |
| first_name         | string  | null: false                     |
| family_name_kana   | string  | null: false                     |
| first_name_kana    | string  | null: false                     |
| prefecture_id      | integer | null: false, foreign_key: true  |
| city               | string  | null: false                     |
| address            | string  | null: false                     |
| building_name      | string  |                                 |
| buyer_user_id      | integer | null: false, foreign_key: true  |
| phone_number       | string  | null: false                     |

### Association

- has_one :order_history