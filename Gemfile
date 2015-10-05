source 'https://rubygems.org'

gem 'rails'

gem 'protected_attributes' # https://github.com/rails/protected_attributes
gem 'activeresource' # https://github.com/rails/activeresource
gem 'actionpack-action_caching' # https://github.com/rails/actionpack-action_caching
gem 'activerecord-session_store' # https://github.com/rails/activerecord-session_store
gem 'rails-observers' # https://github.com/rails/rails-observers
gem 'activerecord-deprecated_finders'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

# Server
# Puma
gem 'puma'

# Renames the app
# use "rails g rename:app_to New-Name" (remember the Upper-Case-Naming-Convention)
gem 'rename'

gem 'mysql2', '~> 0.3.18'

# Slug for Url
# https://github.com/norman/friendly_id
gem 'friendly_id'

# Simple Navigation (and breadcrumb)
# https://github.com/codeplant/simple-navigation
gem 'simple-navigation', '~> 4.0.3'
# https://github.com/pdf/simple-navigation-bootstrap
# (renderer for bootstrap)
gem 'simple-navigation-bootstrap'
# https://github.com/lassebunk/gretel
gem 'gretel'

gem 'mercury-rails', path: '/Users/jan/RubymineProjects/gems/mercury' #git: 'git://github.com/mediatainment/mercury'
gem 'jquery-migrate-rails' # is needed for mercury-rails (js console error)
gem 'ckeditor'
gem 'dropzonejs-rails' # drag and drop for mercury snippets and images

# Multilingual / Translation
# https://github.com/globalize/globalize
gem 'globalize', '~> 5.0.0'

# Authentication System
# https://github.com/plataformatec/devise
gem 'devise'

# Role Management
# https://github.com/CanCanCommunity/cancancan
gem 'cancancan'

# FILEUPLOAD (Carrierwave)
# https://github.com/carrierwaveuploader/carrierwave
gem 'carrierwave'
gem 'mini_magick'

# https://github.com/fog/fog
gem 'fog'

# SEO
# https://github.com/kpumuk/meta-tags
gem 'meta-tags'

# InPlace Editing
# https://github.com/janv/rest_in_place
gem 'rest_in_place'

# Assets

# Gems used only for assets and not required
# in production environments by default.

gem 'jquery-rails'
gem 'sass-rails'
gem 'compass-rails'
gem 'coffee-rails'
gem 'bootstrap-sass', '~> 3.3.1'
gem 'bootstrap-form'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', :platforms => :ruby

gem 'uglifier', '>= 1.0.3'

group :development do
  # create .env file in project root and load variables
  # https://github.com/bkeepers/dotenv
  # extended error stacktrace
  gem 'better_errors'
  gem 'rubymine_heaven'
  gem 'bullet'
  gem 'meta_request'
end

group :development, :test do
  gem 'dotenv-rails'
  gem 'rspec-rails', '~> 3.0'
  gem 'cucumber-rails', :require => false
  gem 'database_cleaner'
  gem 'fabrication'
  gem 'faker'
  gem 'test-unit'
end

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
