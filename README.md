# Ruby on Railsチュートリアル: サンプルアプリケーション 第9章 README.md

これは以下に基づいたサンプル・アプリケーションです。最新版は Rails 5 対応の第４版である。
[*Ruby on Railsチュートリアル　第３版 (Rails 4.2 対応)  
実例を使ってRailsを学ぼう*](https://railstutorial.jp/?version=4.2#toc)
[Michael Hartl](http://www.michaelhartl.com/)著

## 変更履歴
1. 18/10/12 Rails 5.1.6 対応に変更した。
1. 18/12/11 Bootstrap4 に対応するために次のファイルを変更した。
* app\assets\stylesheets\application.scss
* app\views\layouts\application.html.erb
* app\views\layouts\_header.html.erb
* app\views\layouts\_footer.html.erb
* app\views\static_pages\home.html.erb

1. 18/12/12 本バージョンでは次のファイルも変更しています。README.mdのこの変更履歴だけを変更しました。
* app\assets\images\study-862994_1920.jpg -- Homeページに表示される画像です。
* Gemfile -- gemの順番が変わっています。

## 実行環境

```bash
%
```

本プロジェクトは第9章 (ユーザーの更新・表示・削除) のアプリケーションのソースである。インストール手順を次に示す。

## 1) bundler を最新版にする

```bash
% gem update --system
Updating rubygems-update
Fetching rubygems-update-3.0.6.gem
...


```bash
% gem update bundler
% bundle -v
Bundler version 1.17.3
```


## 3) path を指定して bundle を実行する。puma などは development, test 環境では不要なので --without productionを指定。

```bash
% cd <プロジェクトのディレクトリ>
% bundle install --without production
```

## 4) Gemlock ファイルに基付いて、必要な gem をインストールする。

```bash
% bundle update
```

gem install sqlite3 -v '1.4.1' --source 'https://rubygems.org/'
gem install sqlite3 -v '1.3.6' --source 'https://rubygems.org/'

## 5) データベースを構築する

```bash
% bundle exec rake db:migrate
```

## 6) データベースに初期データを追加する。

```bash
% bundle exec rake db:seed
```

## 7) ルーティング規則を調べる

```bash
% bundle exec rake routes
   Prefix Verb   URI Pattern               Controller#Action
     root GET    /                         static_pages#home
     help GET    /help(.:format)           static_pages#help
    about GET    /about(.:format)          static_pages#about
  contact GET    /contact(.:format)        static_pages#contact
   signup GET    /signup(.:format)         users#new
    login GET    /login(.:format)          sessions#new
          POST   /login(.:format)          sessions#create
   logout DELETE /logout(.:format)         sessions#destroy
    users GET    /users(.:format)          users#index
          POST   /users(.:format)          users#create
 new_user GET    /users/new(.:format)      users#new
edit_user GET    /users/:id/edit(.:format) users#edit
     user GET    /users/:id(.:format)      users#show
          PATCH  /users/:id(.:format)      users#update
          PUT    /users/:id(.:format)      users#update
          DELETE /users/:id(.:format)      users#destroy
```

## 8) Rails サーバーを development 環境で実行する。//localhost:3000でアクセスできる。

```bash
% bundle exec rails s
```

## 9) Rails アプリの初期化法

他のPCやディレクトリへコピーしたい場合に実行する。

### a) gem をすべて削除する。

```bash
% bundle exec gem uninstall -I -a -x --user-install --force
```

### b) データベース db/development.sqlite3 を削除する

```bash
% bundle exec rake db:drop:_unsafe
```