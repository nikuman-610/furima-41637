# テーブル設計

## usersテーブル

| Column             | Type    | Options     |
|--------------------|---------|-------------|
| id                 | integer | null: false, unique: true |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false |
| nickname           | string  | null: false |
| first_name         | string  | null: false |
| last_name          | string  | null: false |
| first_name_kana    | string  | null: false |
| last_name_kana     | string  | null: false |
| year_id            | integer | null: false |
| month_id           | integer | null: false |
| day_id             | integer | null: false |

### Association
 - has_many :items
 - has_many :purchase_records
 - belongs_to_active_hash :year_id
 - belongs_to_active_hash :month_id
 - belongs_to_active_hash :day_id

## itemsテーブル

| Column       | Type       | Options     |
|--------------|------------|-------------|
| id           | integer    | null: false, unique: true |
| seller_id    | references | null: false, foreign_key: true |
| item_name    | text       | null: false |
| summary      | text       | null: false |
| price        | integer    | null: false |
| category_id  | integer    | null: false |
| condition_id | integer    | null: false |
| charge_id    | integer    | null: false |
| area_id      | integer    | null: false |
| date_id      | integer    | null: false |

### Association
 - belongs_to :users
 - has_one :purchase_records
 - belongs_to_active_hash :category_id
 - belongs_to_active_hash :condition_id
 - belongs_to_active_hash :charge_id
 - belongs_to_active_hash :area_id
 - belongs_to_active_hash :date_id

## purchase_recordsテーブル

| Column   | Type       | Options                   |
|----------|------------|---------------------------|
| id       | integer    | null: false, unique: true |
| item_id  | references | null: false, foreign_key: true |
| buyer_id | references | null: false, foreign_key: true |

### Association
 - belongs_to :users
 - has_one :items
 - has_one :addresses

## addressesテーブル

| Column        | Type       | Options     |
|---------------|------------|-------------|
| id            | integer    | null: false, unique: true |
| record_id     | references | null: false, foreign_key: true |
| postal_code   | integer    | null: false |
| prefecture    | integer    | null: false |
| city          | string     | null: false |
| house_number  | string     | null: false |
| building_name | string     | null: false |
| phone_number  | integer    | null: false |

### Association
 - has_one :purchase_records
 - belongs_to_active_hash :prefecture