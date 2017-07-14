**ChatSpace**

# データベース設計
## messages table
| Column   | Type    | Options                        |
| -------- | ------- | ------------------------------ |
| user_id  | integer | null: false, foreign_key: true |
| group_id | integer | null: false, foreign_key: true |
| body     | text    |                                |
| image    | string  |                                |
### association
- belongs_to :user
- belongs_to :group

## users table
| Column   | Type    | Options                        |
| -------- | ------- | ------------------------------ |
| email    | string  | null: false, unique: true      |
| password | string  | null: false                    |
| name     | string  | null: false, unique: true, index: true|
### association
- has_many :groups, thorough: :group_users
- has_many :messages
- has_many :group_users

## groups table
| Column | Type   | Options                   |
| ------ | ------ | ------------------------- |
| name   | string | null: false, unique: true |
### association
- has_many :users, through: :group_users
- has_many :messages
- has_many :group_users

## group_users table
| Column   | Type    | Options                        |
| -------- | ------- | ------------------------------ |
| user_id  | integer | null: false, foreign_key: true |
| group_id | integer | null: false, foreign_key: true |
### association
- belongs_to :group
- belongs_to :user
