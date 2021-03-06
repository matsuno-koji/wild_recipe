source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.7'
# Use Puma as the app server
gem 'puma', '~> 3.7'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

#自分で入れたやつ
#デバッグ用
gem "pry-byebug"
#jquery
gem "jquery-rails"
#パスワード暗号化
gem "bcrypt", "~> 3.1.7"
#ページネーション
gem "kaminari"
#データベース内のカウント機能
gem "counter_culture", "2.2.4"
#日本語化
gem "rails-i18n", "~> 5.1"
#管理画面の追加
gem "activeadmin"
#fontawesome
gem "font-awesome-sass", "~> 5.4.1"
#画像処理
gem "carrierwave"
#aws用fog
gem "fog-aws"
#fogが要求
gem "mime-types"
#画像加工
gem "mini_magick"
#環境変数管理
gem "dotenv-rails"
#TwitterAPI関連
gem 'omniauth'
gem 'omniauth-twitter'
#ローカルSSL
gem 'thin'
#SEO対策
gem 'meta-tags'

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  gem "sqlite3", "1.3.13"
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'minitest-reporters', '1.1.14'
  gem 'selenium-webdriver'
  gem "rails-controller-testing"
  #自動デプロイ
  gem 'capistrano', '3.4.0'
  gem 'capistrano-bundler'
  gem 'capistrano-rails'
  gem 'capistrano-rbenv'
  gem 'ed25519'
  gem 'bcrypt_pbkdf'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :production, :staging do
  gem 'unicorn', '5.5.3'
  gem "mysql2"
end
# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
