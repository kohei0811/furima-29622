# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| first_name         | string | null: false               |
| last_name          | string | null: false               |
| first_name_kana    | string | null: false               |
| last_name_kana     | string | null: false               |
| date_of_birth      | date   | null: false               |

### Association

- has_many :product_details
- has_many :purchase_records

## purchase_records テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| user              | references | null: false, foreign_key: true |
| product_detail    | references | null: false, foreign_key: true |

### Association

- belongs_to :product_details
- has_one :address
- has_one :product_detail

## product_details テーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| product_name         | string     | null: false                    |
| product_explanations | text       | null: false                    |
| category_id          | integer    | null: false                    |
| status_id            | integer    | null: false                    |
| delivery_fee_id      | integer    | null: false                    |
| prefectures_id       | integer    | null: false                    |
| days_to_ship_id      | integer    | null: false                    |
| price                | integer    | null: false                    |
| user                 | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- has_many :purchase_records

## address テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| post_code      | string     | null: false                    |
| prefectures_id | integer    | null: false                    |
| municipalities | string     | null: false                    |
| building_name  | string     |                                |
| address        | string     | null: false                    |
| phone_number   | string     | null: false                    |
| purchase_record| string     | null: false, foreign_key: true |

### Association

- belongs_to : purchase_record