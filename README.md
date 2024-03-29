# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | -----------               |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name        | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana   | string | null: false               |
| first_name_kana    | string | null: false               |
| birthday           | date   | null: false               |


### Association

- has_many :items
- has_many :order_histories

## items テーブル

| Column             | Type       | Options                        |
| ------             | ------     | -----------                    |
| user               | references | null: false, foreign_key: true |
| name               | string     | null: false                    |
| description        | text       | null: false                    |
| category_id        | integer    | null: false                    |
| status_id          | integer    | null: false                    |
| price              | integer    | null: false                    |
| prefecture_id      | integer    | null: false                    |
| delivery_cost_id   | integer    | null: false                    |
| days_id            | integer    | null: false                    |

### Association

- belongs_to :user
- has_one :order_history

## orders テーブル

| Column        | Type       | Options                        |
| -------       | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :item
- has_one :destination

## addresses テーブル

| Column             | Type       | Options                         |
| ------------------ | ------     | -----------                     |
| zip_code           | string     | null: false                     |
| prefecture_id      | integer    | null: false                     |
| city               | string     | null: false                     |
| address            | string     | null: false                     |
| building_name      | string     |                                 |
| order              | references | null: false, foreign_key: true  |
| phone_number       | string     | null: false                     |

### Association

- belongs_to :order_history