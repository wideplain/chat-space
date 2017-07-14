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
| name     | string  | null: false, unique: true      |
| group_id | integer | null: false, foreign_key: true |
### association
- has_many :groups, thorough: :members
- has_many :messages
- has_many :members

## groups table
| Column | Type   | Options                   |
| ------ | ------ | ------------------------- |
| name   | string | null: false, unique: true |
### association
- has_many :users, through: :members
- has_many :messages
- has_many :menbers

## menbers table
| Column   | Type    | Options                        |
| -------- | ------- | ------------------------------ |
| user_id  | integer | null: false, foreign_key: true |
| group_id | integer | null: false, foreign_key: true |
### association
- belongs_to :group
- belongs_to :user
