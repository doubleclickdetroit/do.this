source 'https://rubygems.org'

ruby '2.0.0'

gem 'rails', '4.0.0'

gem 'unicorn'

gem 'haml-rails'

# gem 'simple_form', '~> 2.1.0'
gem 'simple_form', github: 'plataformatec/simple_form'

gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

gem 'devise', github: 'plataformatec/devise'

gem 'therubyracer', :platforms => :ruby
gem 'less-rails'
gem 'twitter-bootstrap-rails'
gem 'font-awesome-rails'

gem 'sass-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'

group :development, :test do
  gem 'sqlite3'
  gem 'factory_girl_rails'

  gem 'rspec-rails'

  gem 'cucumber-rails', :require => false
  gem 'database_cleaner'

  gem 'poltergeist'

  gem 'guard-rspec'
  gem 'guard-cucumber'
  gem 'guard-spork'
  gem 'listen'

  if RUBY_PLATFORM.match(/linux/i)
    gem 'rb-inotify' 
  elsif RUBY_PLATFORM.match(/darwin/i)
    gem 'rb-fsevent' 
  end
end

group :production do
  gem 'pg'
end
