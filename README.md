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
| birthday           | date    | null: false |

### Association
 - has_many :items
 - has_many :purchase_records

## itemsテーブル

| Column        | Type       | Options     |
|---------------|------------|-------------|
| id            | integer    | null: false, unique: true |
| user          | references | null: false, foreign_key: true |
| item_name     | string     | null: false |
| summary       | text       | null: false |
| price         | integer    | null: false |
| category_id   | integer    | null: false |
| condition_id  | integer    | null: false |
| charge_id     | integer    | null: false |
| prefecture_id | integer    | null: false |
| date_id       | integer    | null: false |

### Association
 - belongs_to :user
 - has_one :purchase_record
 - belongs_to_active_hash :category_id
 - belongs_to_active_hash :condition_id
 - belongs_to_active_hash :charge_id
 - belongs_to_active_hash :prefecture_id
 - belongs_to_active_hash :date_id

## purchase_recordsテーブル

| Column   | Type       | Options                   |
|----------|------------|---------------------------|
| id       | integer    | null: false, unique: true |
| item     | references | null: false, foreign_key: true |
| user     | references | null: false, foreign_key: true |

### Association
 - belongs_to :user
 - belongs_to :item
 - has_one :address

## addressesテーブル

| Column          | Type       | Options     |
|-----------------|------------|-------------|
| id              | integer    | null: false, unique: true |
| purchase_record | references | null: false, foreign_key: true |
| postal_code     | string     | null: false |
| prefecture_id   | integer    | null: false |
| city            | string     | null: false |
| house_number    | string     | null: false |
| building_name   | string     |             |
| phone_number    | string     | null: false |

### Association
 - belongs_to :purchase_record
 - belongs_to_active_hash :prefecture_id