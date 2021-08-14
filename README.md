# アプリケーション名
 EVERY_DAY_FITNESS
# アプリケーション概要
 フィットネスに特化した情報が投稿できるアプリ。
# URL
 https://every-day-fitness.herokuapp.com/
# テスト用アカウント
Basic認証: ユーザー名「goro」 パスワード 「1209」
# 利用方法
 userはfitnessに関する投稿ができて、編集、削除をすることができる。また、気になった投稿に対してコメントしてコミュニケーションが取れる。
# 目指した課題解決
ダイエット、健康になるための食事等の知識を得ることができる。
# 洗い出した要件
|機能|目的|詳細|ストーリー|
|----|---|---|---------|
|DB設計|アプリ作成の全体像を把握するため|作成テーブル users,fitness,comment|   |
|コメント機能|ユーザーと同士がコミュニケーションを取るため|投稿詳細ページにフォーマットを設置、コメントすることできる。|fitnessトップページから投稿を選択すると詳細ページに遷移し、詳細ページのコメント欄からコメント入力する。|
|ユーザー管理機能|deviseを用いたユーザー管理機能|新規登録、ログイン、ログアウトができる。ログイン時はログアウト表示がでる。|チャットしたい人、fitnessの投稿をしたい人は新規登録、ログインする必要がある。|
|fitness投稿、一覧表示機能|ユーザーが見てみたい投稿を選びやすくするため。|一覧ではnickname、level、titleを表示させる。|投稿するとトップページに遷移し、投稿内容が見ることができる。|
|新規fitness投稿機能|ダイエット、食事等フィットネスに関係する役立つ情報を発信するため。|新規投稿ではtitle、level、category、infoを登録して投稿ボタンを押すと投稿一覧ページに遷移し、投稿が表示されているようにする。|一覧ページの「投稿」から新規投稿ページに遷移し、フィットネスに関する新規情報登録を行う。|
fitness投稿編集機能|投稿内容を更新するため。|ログイン中のユーザーかつ、投稿した本人は編集ボタンから編集ページに遷移して、自身の投稿を編集できる。編集ページではtitle、class、category、infoを編集できる。|ログイン中のユーザーかつ、投稿した本人のみが自身の投稿を編集できる。
fitness投稿削除機能|投稿をDBから削除するため。|ログイン中ユーザーかつ、投稿者本人は削除ボタンから自分の投稿をDBから削除する。|ログイン中のユーザーでかつ、投稿した本人のみが自身の投稿を削除できる。|
ユーザー詳細情報表示機能|自分のnickname、info、今までの投稿を全て表示するため。|ログインしているユーザーと自身が投稿一覧ページと投稿詳細ページのnicknameから投稿者の詳細ページに遷移できる。|自分のお気に入りのユーザーの投稿のみをみたい時にログインしていれば見に行くことができる。|

# 実装予定の機能
|機能|目的|詳細|ストーリー|
|----|---|---|--------|
|投稿検索機能|見たい投稿がすぐに検索できるようにするため。|ユーザーはトップページ上部の検索欄から見たい内容を検索することができる|ユーザーが検索欄から自分にあった投稿を見つけやすくする。|
# ローカルでの動作方法

# テーブル設計
[![Image from Gyazo](https://i.gyazo.com/b1905660b805fc45e18e46792f168b78.png)](https://gyazo.com/b1905660b805fc45e18e46792f168b78)
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
- has_many :comments
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
- has_many   :comments

## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| text    | text       |                                |
| user    | references | null: false, foreign_key: true |
| fitness | references | null: false, foreign_key: true |

### Association

- belongs_to :fitness
- belongs_to :user