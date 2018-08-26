source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

# The standard stuff
gem 'rails', '~> 5.2.1'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.18'
# Use Puma as the app server
gem 'puma', '~> 3.12'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
#gem "therubyracer", platforms: :ruby
gem 'mini_racer', platforms: :ruby
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Authentication & Authorization
gem 'devise'
gem 'devise-i18n'
gem 'devise_invitable'

# Application specific stuff
gem 'cancan'
gem 'figaro'
gem 'rolify'
gem 'simple_form'
gem "uuid"
gem 'high_voltage'
gem 'addressable'
gem 'foundation-rails', '~> 6.3'
gem 'foundation-icons-sass-rails'
gem 'jquery-rails'
gem 'turbolinks'
# needed for endless scrolling
gem 'will_paginate'

# Development support

group :development do
  gem 'rails_layout'
end
group :development, :test do
  gem 'factory_girl_rails'
  gem 'rspec-rails'
end
group :test do
  gem 'capybara'
  gem 'database_cleaner', '1.0.1'
  gem 'email_spec'
end

