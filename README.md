# WildRecipe README

## アプリケーションの概要
  WildRecipeは野食専門のレシピ投稿・共有サービスです。
  url: https://wildrecipe.net

##　技術的ポイント
  * AWS EC2を用いたRails本番環境構築
  * AWS ACMでSSL証明書を発行しSSL化
  * 独自ドメインの取得とAWS Route53を利用した名前解決
  * AWS S3へ画像を保存(CarrierWave+Fogを利用して連携)
  * Capistranoによる自動デプロイ
  * ユーザーフレンドリーな非同期での画面遷移(レシピ投稿部)
    * 材料入力部・手順入力部のインプットフォームを非同期で増減
    * Collectionモデルを利用した複数レコードの受け取り
    * ユーザープロフィールのレシピタブ切替
  * メンテナンス性向上のため、機能毎にテストを作成
  * 実際のサービス利用を考えて管理者機能を実装(Activeadminを利用)

## 機能一覧
  * ユーザー登録[BCrypt]
  * ユーザー認証[BCrypt]
  * レシピ投稿[jQuery]
  * レシピ編集
  * レシピ検索
  * レシピへのコメント
  * レシピのブックマーク
  * レシピのイイネ
  * ページネーション[kaminari]
  * 管理者機能[activeadmin]
  * CSV,XML,JSON出力[activeadmin]

## 環境及び技術構成
  * フレームワーク
    * Ruby on Rails
  * データベース
    * MySQL
  * インフラ
    * AWS EC2
  * Webサーバ
    * Nginx
  * アプリケーションサーバ
    * Unicorn
  * 画像処理・保存
    * ImageMagick
    * CarrierWave
    * Fog-aws
  * 外部ストレージ
    * AWS S3
  * 管理機能
    * Activeadmin