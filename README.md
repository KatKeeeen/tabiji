## アプリケーション名
Tabiji


## アプリケーション概要
旅行やお出かけを記録することで、いつでも思い出を追体験できる。
また、訪れたことのある都道府県が把握できる。


## URL
[tabiji](https://tabiji.onrender.com)


## テスト用アカウント
email: test@test.com  
password: tabijin135


## 利用方法

### 旅を記録する
1. トップページからユーザーの新規登録を行う
2. 旅記録作成ボタンから、旅記録を作成する。
3. 旅記録内でイベントを記録する。

### 都道府県から検索する
1. 都道府県から検索するボタンから、検索画面へ遷移する。
2. 絞り込みたい都道府県を選択する。


## アプリケーションを作成した背景
旅行やお出かけの内容を思い出すことが非常に苦手な私自身だが、
ふとした時に思い出したいことはしっちゅうある。
思い出の残し方のひとつである旅日記（旅ノート）から着想を得て、
風景やその時の感情や情報を記録し、思い出を詳細に追体験できるアプリを開発することにした。


## 洗い出した要件
[要件定義](https://docs.google.com/spreadsheets/d/1Nt_oTZjbJhjCJhJgJy95sNSNmPCBRCZ3gqaM6OXD9dE/edit?usp=sharing)


## 実装した機能についての画像・GIF
* 旅記録機能  
[![Image from Gyazo](https://i.gyazo.com/ff6c7bf77557ce143b7513cb7d2d5a2a.gif)](https://gyazo.com/ff6c7bf77557ce143b7513cb7d2d5a2a)
* 都道府県検索  
[![Image from Gyazo](https://i.gyazo.com/159304a9506cd86dcbabb5555998f088.gif)](https://gyazo.com/159304a9506cd86dcbabb5555998f088)


## データベース設計
![データベース設計](https://i.gyazo.com/fdfc2ecebb5363349bde6f80377320b5.png)


## 画面遷移図
![画面遷移図](https://i.gyazo.com/858716b25f5131d37d98e7250241b16a.png)


## 開発環境
* フロントエンド : HTML / CSS / JavaScript
* バックエンド : Ruby(フレームワーク : Ruby on Rails)
* OS : macOS Monterey
* テキストエディタ : Visual Studio Code
* タスク管理 : GitHub







## テーブル設計

### users テーブル
| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| birth_day          | date   | null: false               |

#### Association
- has_many  :journals


### journals テーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| title              | string     | null: false                    |
| comment            | text       |                                |
| departure_date     | date       | null: false                    |
| last_date          | date       | null: false                    |
| user               | references | null: false, foreign_key: true |

#### Association
- belongs_to  :user
- has_many    :events
- has_many    :journal_prefectures


### events テーブル
| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| date    | date       | null: false                    |
| time    | time       | null: false                    |
| place   | string     |                                |
| comment | text       | null: false                    |
| journal | references | null: false, foreign_key: true |

#### Association
- belongs_to  :journal


### prefectures テーブル
| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| prefecture_list_id | integer | null: false |

#### Association
- has_many    :journal_prefectures


### journal_prefectures テーブル
| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| journal_id    | references | null: false, foreign_key: true |
| prefecture_id | references | null: false, foreign_key: true |

#### Association
- belongs_to  :journal
- belongs_to  :prefectures