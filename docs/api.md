# API

| パス                  | メソッド | 概要           |
| --------------------- | -------- | -------------- |
| /user/login           | POST     | ログイン       |
| /user/logout          | GET      | ログアウト     |
| /user/change_password | PUT      | パスワード変更 |

- ログイン
- ログアウト
- パスワード変更
- スケジュール
  - 一覧
  - 詳細
  - 変更
  - 削除
  - 登録
- 講義一覧

## シーケンス図

### ログイン

```mermaid
sequenceDiagram
    title ログインシーケンス図
    autonumber
    actor USER as ユーザー
    participant LOGIN as ログイン画面
    participant API
    participant DB

    USER ->> LOGIN: ログイン
    LOGIN ->> API: ID/PW認証
    API ->> DB: 該当のユーザーが存在するか
    DB ->> API: 結果

    alt 正常終了
      API->> API: セッション作成
      API ->> LOGIN: セッション情報
      LOGIN ->> USER: 講義一覧にリダイレクト
    else エラー
      Note over USER : エラー表示
    end
```

### スケジュール一覧

```mermaid
sequenceDiagram
    title スケジュールシーケンス図
    autonumber
    actor USER as ユーザー
    participant SCHEDULES as スケジュール画面
    participant API
    participant DB

    USER ->> SCHEDULES: スケジュール画面表示
    SCHEDULES ->> API: 一覧取得
    API ->> DB: スケジュールデータの取得
    DB ->> API: 結果

    API ->> SCHEDULES: スケジュール情報
    SCHEDULES ->> USER: スケジュール情報の反映
```