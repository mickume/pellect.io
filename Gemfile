source 'https://rubygems.org'
ruby '2.3.1'

# standard stuff
gem 'rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'cancan'
gem 'devise'
gem 'figaro'
gem 'mysql2'
gem 'rolify'
gem 'simple_form', '~> 3.0.2'
gem "uuid", "~> 2.3.7"
gem 'high_voltage', '~> 2.1.0'
gem 'addressable'

# asset gems
gem 'sass-rails', '~> 4.0.3'
gem 'foundation-rails'
gem 'foundation-icons-sass-rails'
gem 'uglifier', '>= 2.5.0'
gem 'coffee-rails', '~> 4.0.1'

# needed for endless scrolling
gem 'will_paginate'

# mail-in support
gem 'griddler', :git => 'https://github.com/ratchetcc/griddler.git'

group :development do
  gem 'thin'
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
group :production do
  gem 'unicorn'
end
