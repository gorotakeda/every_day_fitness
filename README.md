# アプリケーション名
 EVERY_DAY_FITNESS
# アプリケーション概要
 フィットネス情報に特化した投稿ができるアプリ。また、ユーザー同士でコミュニケーションが取れる。
# URL
 https://every-day-fitness.herokuapp.com/
# テスト用アカウント
Basic認証: ユーザー名「goro」 パスワード 「1209」
# 利用方法
 userはfitnessに関する投稿ができて、編集、削除をすることができる。また、気になったuserとメッセージのやり取りができる。
# 目指した課題解決
投稿される内容はフィットネスに関する情報のみ。詳しく内容を聞きたい場合は気軽にチャットできる。これらのことから今までダイエットに挫折してきた人が正しい知識を得て健康になることができる。
# 洗い出した要件
|機能|目的|詳細|ストーリー|
|----|---|---|---------|
|DB設計|アプリ作成の全体像を把握するため|作成テーブル users,fitness,rooms,messages,room_users|   |
|チャット機能|ユーザーと同士がコミュニケーションを取るため|トップページのチャットするから、チャット作成画面に遷移し、選択したユーザーとルームを作成しそこでチャットできる。日付、画像、文字を投稿できる。|fitnessトップページから『チャットする』を選択するとチャットページに遷移する。|
|ユーザー管理機能|deviseを用いたユーザー管理機能|新規登録、ログイン、ログアウトができる。ログイン時はログアウト表示がでる。|チャットしたい人、fitnessの投稿をしたい人は新規登録、ログインする必要がある。|
|fitness投稿、一覧表示機能|ユーザーが見てみたい投稿を選びやすくするため。|一覧ではnickname、level、titleを表示させる。|投稿するとトップページに遷移し、投稿内容が見ることができる。|
|新規fitness投稿機能|ダイエット、食事等フィットネスに関係する役立つ情報を発信するため。|新規投稿ではtitle、level、category、infoを登録して投稿ボタンを押すと投稿一覧ページに遷移し、投稿が表示されているようにする。|一覧ページの「投稿」から新規投稿ページに遷移し、フィットネスに関する新規情報登録を行う。|
fitness投稿編集機能|投稿内容を更新するため。|ログイン中のユーザーかつ、投稿した本人は編集ボタンから編集ページに遷移して、自身の投稿を編集できる。編集ページではtitle、class、category、infoを編集できる。|ログイン中のユーザーかつ、投稿した本人のみが自身の投稿を編集できる。
fitness投稿削除機能|投稿をDBから削除するため。|ログイン中ユーザーかつ、投稿者本人は削除ボタンから自分の投稿をDBから削除する。|ログイン中のユーザーでかつ、投稿した本人のみが自身の投稿を削除できる。|
ユーザー詳細情報表示機能|自分のnickname、info、今までの投稿を全て表示するため。|ログインしているユーザーと自身が投稿一覧ページと投稿詳細ページのnicknameから投稿者の詳細ページに遷移できる。|自分のお気に入りのユーザーの投稿のみをみたい時にログインしていれば見に行くことができる。|

# 実装予定の機能
|機能|目的|詳細|ストーリー|
|----|---|---|--------|
|ユーザー情報編集機能|ユーザーの情報を更新するため。|ログイン中のユーザーかつ、本人のみユーザー詳細情報表示機能からユーザー情報編集ページに遷移することができ。編集ではnicknameとinfoを編集することができる。||
|投稿検索機能|見たい投稿がすぐに検索できるようにするため。|ユーザーはトップページ上部の検索欄から見たい内容を検索することができる|ユーザーが検索欄から自分にあった投稿を見つけやすくする。|
|投稿にいいねする機能|自分のお気に入りの投稿にリアクションするため。|ログイン中のユーザーは投稿詳細ページで投稿内容が気に入ればいいねボタンをおしてリアクションすることができる。||
# ローカルでの動作方法

# テーブル設計
[![Image from Gyazo](https://i.gyazo.com/ecd3a88d1c60a78e5d973f86e02de9ce.png)](https://gyazo.com/ecd3a88d1c60a78e5d973f86e02de9ce)
## users テーブル
| Column                | Type   | Options      |
|-----------------------|--------|--------------|
| nickname              | string | null: false  |
| email                 | string | unique: true |
| encrypted_password    | string | null: false  |
| last_name             | string | null: false  |
| first_name            | string | null: false  |
| profile               | text   | null: false  |
### Association
- has_many :room_users
- has_many :rooms, through: :room_users
- has_many :messages
- has_many :fitnesses

## fitnessesテーブル

| Column                 | Type       | Options                        |
|------------------------|------------|--------------------------------|
| title                  | text       | null: false                    |
| info                   | text       | null: false                    |
| category_id            | integer    | null: false                    |
| level_id               | integer    | null: false                    |
| user                   | references | null: false, foreign_key: true |

### Association

- belongs_to :user

## rooms テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |

### Association

- has_many :room_users
- has_many :users, through: :room_users
- has_many :messages

## room_users テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| room   | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user

## messages テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     |                                |
| user    | references | null: false, foreign_key: true |
| room    | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user