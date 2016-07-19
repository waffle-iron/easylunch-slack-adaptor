source 'https://rubygems.org'
ruby '2.3.1'

##### Candidates #####
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

##### Core #####
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.6'
# Use postgresql as the database for Active Record
gem 'pg', '0.18.4'
# Use SCSS for stylesheets
gem 'sass-rails', '5.0.5'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '3.0.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '4.1.1'
# Use jquery as the JavaScript library
gem 'jquery-rails', '4.1.1'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks', '5.0.0'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '2.5.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '0.4.1', group: :doc
# Use environment variable
gem 'figaro', '1.1.1'

group :development do
  # Set coding convention
  gem 'rubocop', '0.40.0', require: false
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '2.3.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring', '1.7.2'
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', '9.0.5'
  gem 'pry-byebug', '3.4.0'
end

group :production do
  # For deploy to heroku
  gem 'rails_12factor', '0.0.3'
  # Set puma web server
  gem 'puma', '3.4.0'
end