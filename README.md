# テーブル設計

## users テーブル

| Column          | Type     | Options      |
| --------------- | -------- | ------------ |
| uid             | string   | null: false  |
| nickname        | string   | null: false  |
| name            | string   | null: false  |
| image           | string   | null: false  |
| profile         | text     |              |

### Association

- has_many :user_schedules
- has_many :events, through: user_event_relations
- has_many :comments

## user_schedules テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| start_date | datetime   |                                |
| end_date   | datetime   |                                |
| day_time   | boolean    |                                |
| night_time | boolean    |                                |
| allday     | boolean    |                                |
| user       | references | null: false, foreign_key: true |

### Association

- belongs_to :user

## user_event_relations テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| user       | references | null: false, foreign_key: true |
| event      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :event

## event テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| title            | string     | null: false                    |
| system_id        | integer    | null: false                    |
| description      | text       | null: false                    |

### Association

- has_many :event_schedules
- has_many :users, through: user_event_relations
- has_many :comments
- has_many :tags, through: event_tags


## comments テーブル

| Column  | Type       | Options                        |
| --------| ---------- | ------------------------------ |
| content | text       | null: false                    |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :event

## event_schedules テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| start_date | datetime   | null: false                    |
| end_date   | datetime   | null: false                    |
| day_time   | boolean    | null: false                    |
| night_time | boolean    | null: false                    |
| allday     | boolean    | null: false                    |
| event      | references | null: false, foreign_key: true |

### Association

- belongs_to :event

## event_tags テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| tag        | references | null: false, foreign_key: true |
| event      | references | null: false, foreign_key: true |

### Association

- belongs_to :event
- belongs_to :tag

## tags テーブル

| Column          | Type     | Options                   |
| --------------- | -------- | ------------------------- |
| name            | string   | null: false, unique: true |

### Association

- has_many :events, through: event_tags
