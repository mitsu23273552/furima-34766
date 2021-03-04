## users テーブル
| Column    | Type   | Options     |
| --------- | ------ | ----------- |
| nickname  | string | null: false |
| email     | string | null: false |
| password  | string | null: false |
| name      | string | null: false |
| name_kana | string | null: false |
| birthday  | date   | null: false |

### Association
has_many :items
has_many :to_addresses
has_many :rops


## items テーブル
| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| user            | references | null: false, foreign_key: true |
| title           | string     | null: false                    |
| comment         | text       | null: false                    |
| category        | string     | null: false                    |
| price           | integer    | null: false                    |
| item_quality    | string     | null: false                    |
| delivery_fee    | string     | null: false                    |
| from_prefecture | string     | null: false                    |
| delivery_days   | string     | null: false                    |

### Association
belongs_to :user
has_one :to_address
has_one :messages


## to_addresses テーブル
| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| user                | references | null: false, foreign_key: true |
| item                | references | null: false, foreign_key: true |
| to_postal_code      | integer    | null: false                    |
| to_prefecture       | string     | null: false                    |
| to_city             | string     | null: false                    |
| to_address1         | string     | null: false                    |
| to_address2         | string     |                                |
| to_telephone_number | integer    | null: false                    |

### Association
belongs_to :user
has_one :item


## rops テーブル
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association
belongs_to :user
has_one :item