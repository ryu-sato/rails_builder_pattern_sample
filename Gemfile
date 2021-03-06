source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.3'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
# Full-stack web application framework. (http://rubyonrails.org)
gem 'rails', '~> 5.2.2'
# Use sqlite3 as the database for Active Record
# This module allows Ruby programs to interface with the SQLite3 database engine (http://www.sqlite.org) (https://github.com/sparklemotion/sqlite3-ruby)
gem 'sqlite3'
# Use Puma as the app server
# Puma is a simple, fast, threaded, and highly concurrent HTTP 1.1 server for Ruby/Rack applications (http://puma.io)
gem 'puma', '~> 3.11'
# Use SCSS for stylesheets
# Sass adapter for the Rails asset pipeline. (https://github.com/rails/sass-rails)
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
# Ruby wrapper for UglifyJS JavaScript compressor (http://github.com/lautis/uglifier)
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
# CoffeeScript adapter for the Rails asset pipeline. (https://github.com/rails/coffee-rails)
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
# Turbolinks makes navigating your web application faster (https://github.com/turbolinks/turbolinks)
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# Create JSON structures via a Builder-style DSL (https://github.com/rails/jbuilder)
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
# Boot large ruby/rails apps faster (https://github.com/Shopify/bootsnap)
gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  # Ruby fast debugger - base + CLI (http://github.com/deivid-rodriguez/byebug)
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  
  # Use Pry as your rails console (https://github.com/rweng/pry-rails)
  gem 'pry-rails'
  # Fast debugging with Pry. (https://github.com/deivid-rodriguez/pry-byebug)
  gem 'pry-byebug'
  # Walk the stack in a Pry session (https://github.com/pry/pry-stack_explorer)
  gem 'pry-stack_explorer'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  # A debugging tool for your Ruby on Rails applications. (https://github.com/rails/web-console)
  gem 'web-console', '>= 3.3.0'
  # Listen to file modifications (https://github.com/guard/listen)
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  # Rails application preloader (https://github.com/rails/spring)
  gem 'spring'
  # Makes spring watch files using the listen gem. (https://github.com/jonleighton/spring-watcher-listen)
  gem 'spring-watcher-listen', '~> 2.0.0'
  
  # Add comments to your Gemfile with each dependency's description. (https://github.com/ivantsepp/annotate_gem)
  gem 'annotate_gem'
  # Annotates Rails Models, routes, fixtures, and others based on the database schema. (http://github.com/ctran/annotate_models)
  gem 'annotate'

  # A Ruby language server (http://solargraph.org)
  gem 'solargraph'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  # Capybara aims to simplify the process of integration testing Rack applications, such as Rails, Sinatra or Merb (https://github.com/teamcapybara/capybara)
  gem 'capybara', '>= 2.15'
  # The next generation developer focused tool for automated testing of webapps (https://github.com/SeleniumHQ/selenium)
  gem 'selenium-webdriver'
  # Easy installation and use of chromedriver to run system tests with Chrome
  # Easy installation and use of chromedriver. (https://github.com/flavorjones/chromedriver-helper)
  gem 'chromedriver-helper'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
# Timezone Data for TZInfo (http://tzinfo.github.io)
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# Flexible authentication solution for Rails with Warden (https://github.com/plataformatec/devise)
gem 'devise'

# Devise extension to allow authentication via LDAP (https://github.com/cschiewek/devise_ldap_authenticatable)
gem 'devise_ldap_authenticatable'

# Roles library with resource scoping (https://github.com/RolifyCommunity/rolify)
gem 'rolify'

# Simple authorization solution for Rails. (https://github.com/CanCanCommunity/cancancan)
gem 'cancancan'

# Active Admin is a Ruby on Rails plugin for generating administration style interfaces. It abstracts common business application patterns to make it simple for developers to implement beautiful and elegant interfaces with very little effort. (https://activeadmin.info)
gem 'activeadmin'

# Track changes to your models. (https://github.com/paper-trail-gem/paper_trail)
gem 'paper_trail'
