source "https://rubygems.org"
git_source(:github){|repo| "https://github.com/#{repo}.git"}

gem "bcrypt"
gem "bootsnap", ">= 1.1.0", require: false
gem "bootstrap"
gem "bootstrap4-kaminari-views"
gem "cancancan"
gem "carrierwave"
gem "cloudinary"
gem "cocoon"
gem "coffee-rails", "~> 4.2"
gem "config"
gem "devise"
gem "faker"
gem "figaro"
gem "hirb"
gem "jbuilder", "~> 2.5"
gem "jquery-rails"
gem "kaminari"
gem "mysql2"
gem "ransack"
gem "redis"
gem "puma", "~> 3.11"
gem "rails", "~> 5.2.1", ">= 5.2.1.1"
gem "recaptcha"
gem "sass-rails", "~> 5.0"
gem "social-share-button"
gem "turbolinks", "~> 5"
gem "uglifier", ">= 1.3.0"
gem "pry-rails"

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "factory_bot_rails", require: false
  gem "shoulda-matchers", require: false
end

group :development do
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "rspec-rails", "~> 3.8"
  gem "rubocop", "~> 0.54.0", require: false
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "web-console", ">= 3.3.0"
end

group :production do
  gem "capistrano"
  gem "capistrano3-puma"
  gem "capistrano-rails", require: false
  gem 'capistrano-passenger'
  gem "capistrano-yarn"
  gem "capistrano-bundler", require: false
  gem "capistrano-rails"
  gem "capistrano-rails-db"
  gem "capistrano-rvm"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
