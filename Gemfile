source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.4'

# Use postgresql as the database for Active Record
gem 'pg'

# You need this gem for Bootstrap to work properly. Restart your server if it didn't.
# IF THAT DID NOT WORK BE SURE TO CHANGE YOUR APP.CSS FILE TO A APP.CSS.SCSS
gem 'bootstrap-sass', '~> 3.2.0'

gem 'turbolinks'



# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.2'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks


# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# better errors must have all the following gems to work
group :development, :test do
	gem "pry-rails"
	gem "better_errors"
	gem "binding_of_caller"
end

gem 'bcrypt', '~> 3.1.7'

# The aws gem interacts with S3
# Also added paper clip on 10-8-14. 
# Paperclip & aws-sdk gems allow us to save our avatars!

gem 'paperclip'
gem 'aws-sdk'
gem 'aws-s3'	

gem 'will_paginate', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

# ***THREE THINGS BELOW ARE NEEDED FOR HEROKU DEPLOYMENT ***

# THIS IS THE THIRD GEM NEEEDED FOR HEROKU! NOW GO RUN touch config/unicorn.rb IN COMMAND LINE!
gem 'rails_12factor', group: :production

# THIS IS THE SECOND GEM NEEDED FOR GETTING APP ON HEROKU
gem "unicorn"

# GEM FOR FOLLOWS,LIKES,ETC.
gem "socialization"

gem 'font-awesome-less'


# ÷gem 'acts_as_votable', '~> 0.10.0'
gem "therubyracer"
gem "less-rails"
gem "twitter-bootstrap-rails"

# RUBY '2.1.2' IS NEEDED TO GET APP ON HEROKU. FIRST GEM NEEDED
ruby "2.1.2"