# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.3'
gem 'ancestry'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'bootstrap-sass'
gem 'autoprefixer-rails'
gem 'coffee-rails', '~> 4.2'
gem 'font-awesome-rails'
gem 'haml-rails'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'rails', '~> 5.2.1'
gem 'sass-rails', '~> 5.0'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'
gem 'active_link_to'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'rspec-rails', '~> 3.8'
  gem 'factory_bot_rails'
  gem 'fuubar'
  gem 'database_cleaner'
end

group :development do
  gem 'guard'
  gem 'guard-rspec'
  gem 'better_errors'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'pry'
  gem "binding_of_caller"
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'rspec'
  gem 'capybara', '>= 2.15'
  gem 'chromedriver-helper'
  gem 'selenium-webdriver'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

gem 'cocoon'
gem 'simple_form'

# gem 'elasticsearch-model', github: 'elastic/elasticsearch-rails', branch: '6.x'
# gem 'elasticsearch-rails', github: 'elastic/elasticsearch-rails', branch: '6.x'
# gem 'searchkick'