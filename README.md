## users テーブル
| Column              | Type   | Options                   |
| ------------------- | ------ | ------------------------- |
| nickname            | string | null: false               |
| email               | string | null: false, unique: true |
| encrypted_password  | string | null: false               |
| last_name           | string | null: false               |
| first_name          | string | null: false               |
| last_name_kana      | string | null: false               |
| first_name_kana     | string | null: false               |
| birthday            | date   | null: false               |

### Association
has_many :items
has_many :rops


## items テーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| title              | string     | null: false                    |
| item_comment       | text       | null: false                    |
| category_id        | integer    | null: false                    |
| price              | integer    | null: false                    |
| item_quality_id    | integer    | null: false                    |
| delivery_fee_id    | integer    | null: false                    |
| prefecture_id      | integer    | null: false                    |
| delivery_day_id    | integer    | null: false                    |

### Association
belongs_to :user
has_one :rop


## to_addresses テーブル
| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| rop                 | references | null: false, foreign_key: true |
| to_postal_code      | string     | null: false                    |
| prefecture_id       | integer    | null: false                    |
| to_city             | string     | null: false                    |
| to_address1         | string     | null: false                    |
| to_address2         | string     |                                |
| to_telephone_number | string     | null: false                    |

### Association
belongs_to :rop


## rops テーブル
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association
belongs_to :user
belongs_to :item
has_one :to_address