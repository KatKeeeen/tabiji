# README


# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| birth_day          | date   | null: false               |

### Association

- has_many  :journals


## journals テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| title              | string     | null: false                    |
| comment            | text       |                                |
| departure_date     | date       | null: false                    |
| last_date          | date       | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to  :user
- has_many    :events
- has_many    :journal_prefectures


## events テーブル

| Column  | Type       | Options                       |
| ------- | ---------- | ----------------------------- |
| date    | date       | null: false                   |
| time    | time       | null: false                   |
| place   | string     | null: false                   |
| comment | text       | null: false                   |
| journal | references | null: false foreign_key: true |

### Association

- belongs_to  :journal


## prefectures テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| prefecture_list_id | integer | null: false |

### Association

- has_many    :journal_prefectures


## journal_prefectures テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| journal_id    | references | null: false, foreign_key: true |
| prefecture_id | references | null: false, foreign_key: true |

### Association

- belongs_to  :journal
- belongs_to  :prefectures