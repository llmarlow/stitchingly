source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.0.1'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'bootstrap-sass', '~> 3.3.5.1'
gem "font-awesome-rails"
gem 'will_paginate', '~> 3.1.0'
gem 'will_paginate-bootstrap'
gem 'devise', '~> 4.2'
gem 'simple_form'
gem 'carrierwave', '~> 1.0'
gem 'ransack'
gem "figaro"
gem "fog"
gem 'mini_magick', '~> 4.3.1'
gem 'acts_as_votable', '~> 0.10.0'
gem 'friendly_id', '~> 5.1'
gem 'rails_12factor', group: :production
gem 'sprockets', '~>3.7.2'

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'rspec-rails', '~> 3.5'
  gem 'rails-controller-testing'
  gem 'factory_girl_rails'
end

group :test do
  gem 'shoulda-matchers', '~> 3.1'
  gem 'faker'
  gem 'capybara'
  gem 'launchy'
  gem 'database_cleaner'
  
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'guard-rspec', require: false
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
