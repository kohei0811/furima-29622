# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false, unique: true |
| first_name         | string | null: false               |
| last_name          | string | null: false               |
| date_of_birth      | string | null: false               |

### Association

- has_many :product_details
- has_many :purchase_record

## purchase_records テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| users             | references | null: false, foreign_key: true |
| product_details   | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- has_one :address

## product_details テーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| product_name         | string     | null: false                    |
| product_explanations | text       | null: false                    |
| category_id          | integer    | null: false                    |
| status_id            | integer    | null: false                    |
| delivery_fee_id      | integer    | null: false                    |
| ship_from            | string     | null: false                    |
| price                | integer    | null: false                    |
| users                | references | null: false, foreign_key: true |

### Association

- has_one :purchase_record

## address テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| post_code      | string     |                                |
| prefectures    | string     | null: false                    |
| municipalities | string     | null: false                    |
| building_name  | string     |                                |
| address        | string     | null: false                    |
| phone_number   | string     | null: false                    |

### Association

- belongs_to : purchase_record