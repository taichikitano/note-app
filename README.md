# README

# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |

### Association
- has_many :folder_users
- has_many :folders, through: :folder_users
- has_many :notes


## folders テーブル

| Column | Type   | Options     | 
| ------ | ------ | ----------- |
| name   | string | null: false |

### Association
- has_many :folder_users
- has_many :users, through: :folder_users
- has_many :notes


## room_users テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| folder | references | null: false, foreign_key: true |

### Association
- belongs_to :folder
- belongs_to :user

## messages テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     |                                |
| user    | references | null: false, foreign_key: true |
| folder  | references | null: false, foreign_key: true |

### Association
- belongs_to :folder
- belongs_to :user
