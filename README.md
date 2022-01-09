# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false               |
| encrypted_password | string | null: false, unique: true |

### Association

- has_many :product_info
- has_many :purchase_record, through:product_info 

## purchase_record テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| buyer             | references | null: false, foreign_key: true |
| shipping_address  | string     | null: false                    |

### Association

- has_many :users, through:product_info
- belongs_to :product_info
- has_one :address

## product_info テーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| photo                | string     | null: false                    |
| product_name         | string     | null: false                    |
| product_explanations | string     | null: false                    |
| category             | string     | null: false                    |
| status               | string     | null: false                    |
| delivery_fee         | string     | null: false                    |
| ship_from            | string     | null: false                    |
| price                | string     | null: false                    |
| seller               | references | null: false, foreign_key: true |

### Association

- has_one :purchase_record
- 

## address テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| post_code      | string     |                                |
| prefectures    | string     | null: false                    |
| municipalities | string     | null: false                    |
| address        | string     | null: false                    |
| phone-number   | references | null: false, foreign_key: true |

### Association

- has_many : purchase_record