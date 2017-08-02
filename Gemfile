source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.1'
# Use mysql as the database for Active Recor
# Use Puma as the app server
gem 'puma', '~> 3.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails'
gem 'coffee-script-source', '1.8.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'
# Use Capistrano for deployment
gem 'acts-as-taggable-on'
gem 'carrierwave-imageoptimizer'
# gem 'capistrano-rails', group: :development
gem 'devise'
gem 'simple_form'
gem 'bootstrap-sass'
gem 'rails_autolink'
gem 'mysql2'
gem 'haml'
gem 'carrierwave'
gem 'will_paginate'
gem 'jquery-ui-rails'
gem 'rails-jquery-tokeninput'
gem 'acts_as_votable'
gem 'time_difference'
gem 'devise-bootstrap-views'
gem 'mini_magick'
gem 'whenever' , require: false
gem 'acts_as_follower', github: 'tcocca/acts_as_follower', branch: 'master'
gem 'momentjs-rails'
gem 'bootstrap3-datetimepicker-rails'
group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'mysql2'
end

group :production do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'pg'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
