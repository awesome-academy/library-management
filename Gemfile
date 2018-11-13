source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem "rails", "~> 5.1.6"
gem "puma", "~> 3.7"
gem "sass-rails", "~> 5.0"
gem "uglifier", ">= 1.3.0"
gem "coffee-rails", "~> 4.2"
gem "turbolinks", "~> 5"
gem "jbuilder", "~> 2.5"
gem "mysql2"
gem "cancancan"
gem "devise"
gem "rails-i18n"
gem "config"
gem "kaminari"
gem "bootstrap-kaminari-views"
gem "jquery-rails"
gem "ffaker"
gem "toastr-rails"
gem "jquery-rails"
gem "ransack"
gem "carrierwave"
gem "mini_magick"
gem "chartkick"
gem "momentjs-rails", ">= 2.9.0"
gem "bootstrap3-datetimepicker-rails", "~> 4.17.47"
gem "bootstrap-sass"
gem "sidekiq"
gem "sidekiq-cron"

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "capybara", "~> 2.13"
  gem "selenium-webdriver"
end

group :development do
  gem "web-console", ">= 3.3.0"
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
