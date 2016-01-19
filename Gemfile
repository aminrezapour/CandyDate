source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.4'

# This is for when pushing to Heroku. In case of pushning to something else, re
# the documentation of the corresponding service.
group :production do
 gem 'pg'
 gem 'rails_12factor'
end

# #2
group :development do
 gem 'sqlite3'
end

# Note that this gem is going to be available for bothe development & test env.
group :development, :test do
   gem 'rspec-rails', '~> 3.0'
   gem 'shoulda'
   gem 'factory_girl_rails', '~> 4.0'
   gem 'faker'
end

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Add Bootstrap here
gem 'bootstrap-sass'
# Used for encypting User passwords. It needs password_digest is User model
gem 'bcrypt'
# Figaro to store environment variables
gem 'figaro', '1.0'
# To make sign up and sign in easier
gem 'devise'
# To add user authorization and policies
gem 'pundit'
# Facebook login
gem 'omniauth-facebook'
# Twilio
gem 'twilio-ruby'
