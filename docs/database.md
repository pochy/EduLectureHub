# ER 図

```mermaid
erDiagram
    lectures ||--o{ schedules : ""
    users ||--o{ schedules : ""
    users ||--o{ lectures : ""

    users {
        bigint id PK "ID"
        varchar password_digest "ハッシュ化されたパスワード"
        varchar last_name "苗字"
        varchar first_name "名前"
        timestamp created_at "作成日時"
        timestamp updated_at "更新日時"
    }

    lectures {
        bigint id PK "ID"
        bigint instructor_id FK "user ID"
        varchar title "名称"
        int day_of_week "曜日"
        int period "n限目"
        timestamp created_at "作成日時"
        timestamp updated_at "更新日時"
    }

    schedules {
        bigint id PK "ID"
        bigint lecture_id FK "lectures ID"
        bigint user_id FK "user ID"
        timestamp created_at "作成日時"
        timestamp updated_at "更新日時"
    }
```


lectures テーブルの day_of_week は曜日、period は n限目を表す


|        | day_of_week | 1   | 2    | 3    | 4   | 5    | 6   |
| ------ | ----------- | --- | ---- | ---- | --- | ---- | --- |
| period |             | 月  | 火   | 水   | 木  | 金   | 土  |
| 1      | 1限目       |     |      |      |     |      |     |
| 2      | 2限目       |     | 数学 |      |     |      |     |
| 3      | 3限目       |     |      | 物理 |     |      |     |
| 4      | 4限目       |     |      |      |     |      |     |
| 5      | 5限目       |     |      |      |     | 社会 |     |
| 6      | 6限目       |     |      |      |     |      |     |
