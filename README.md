# Up to U
<br>

**概要**
* 自分の持っている洋服を画像として保存出来る  
* 着た洋服をカレンダー上に登録できる(未実装)  
* カレンダーに予定の書き込みができる(未実装)  
* 天気の確認ができる(未実装)  
* オンライン投稿機能で他ユーザーに自分のコーディネートを公開できる  
* 他ユーザーの投稿した写真にコメントできる  
* 他ユーザーの投稿に評価マークを押せる  
<br>

**機能説明**
* ユーザー登録が必須  
* Wardrobe機能で自分の持っている洋服を保存  
* Wardrobeでは自分の洋服のみ確認できる  
* Runway機能で自分のお気に入りコーディネートを投稿できる  
* Runwayでは自分、他者のコーディネートを閲覧できる  
* Runway内下部のコメント投稿機能で他ユーザーの洋服にコメントできる  
* Runway内ハートマークで他ユーザーの投稿にいいねを送れる  
* Wardrobe,Runway機能共にカテゴリー検索が可能  
<br>

**制作背景**
* 通勤や通学、私生活と日頃から私服をきている人にとって毎日の洋服選びは大変。  
自分のお気に入りのコーディネートを公開して評価をもらうことでより毎日着る洋服を楽しんでもらいたい。  
自分の洋服を画像で保存しておけば買い物に行った際に同じようなものを買う必要がなく、新しい服を買うときに手持ちのものと合わせるための手助けになる。  
<br>

**実装予定機能**
* ユーザー登録機能  
* 洋服画像登録機能  
* カレンダー機能(未実装)  
* コメント機能  
* 天気予報機能(未実装)  
* オンライン投稿機能  
* オンラインコメント機能  
* 評価ボタン機能  
<br>
<br>

**DB 設計**

## Users table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| email              | string              | null: false             |
| encrypted_password | string              | null: false             |
| nickname           | string              | null: false             |
| gender_id          | integer             | null: false             |
| prefecture_id      | integer             | null: false             |

### Association

* has_many :clothes
* has_many :plans
* has_many :posts
* has_many :comments
* has_many :likes
* has_many :weathers


## Clothes table

| Column           | Type          | Options             |
| ---------------- | ------------- | ------------------- |
| category_id      | integer       | null: false         |
| description      | text          | null: false         |
| user             | references    | foreign_key: true   |

### Association
* belongs_to :user
* has_many :plan


## Plans table

| Column           |Type           |Options              |
| ---------------- | ------------- | ------------------- |
| date             | date          | null: false         |
| schedule         | text          | null: false         |
| user             | references    | foreign_key: true   |
| clothe           | references    | foreign_key: true   |

### Association
* belongs_to :user
* has_many :clothes


## Posts table

| Column           |Type           |Options              |
| ---------------- | ------------- | ------------------- |
| detail           | text          | null: false         |
| season_id        | integer       | null: false         |
| user             | references    | foreign_key: true   |

### Association
* belongs_to :user
* has_many :comments
* has_many :like


## Comments table

| Column           |Type           |Options              |
| ---------------- | ------------- | ------------------- |
| text             | text          | null: false         |
| user             | references    | foreign_key: true   |
| post             | references    | foreign_key: true   |

### Association
* belongs_to :user
* belongs_to :post


## Likes table

| Column           |Type           |Options              |
| ---------------- | ------------- | ------------------- |
| user             | references    | foreign_key: true   |
| post             | references    | foreign_key: true   |

### Association
* belongs_to :user
* belongs_to :post


## Weathers table

| Column           |Type           |Options              |
| ---------------- | ------------- | ------------------- |
| user             | references    | foreign_key: true   |

### Association
* belongs_to :user