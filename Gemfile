source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

gem 'bootsnap', '>= 1.1.0', require: false
gem 'bootstrap', '~> 4.3.1'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails', '~> 4.3', '>= 4.3.5'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'rails', '~> 5.2.3'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'

group :development, :test do
  gem 'factory_bot_rails', '~> 5.1', '>= 5.1.1'
  gem 'pry', '~> 0.12.2'
  gem 'reek', '~> 5.4'
  gem 'rspec-rails', '~> 3.9'
  gem 'rubocop', '~> 0.75.1'
  gem 'shoulda-matchers', '~> 4.1', '>= 4.1.2'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'capybara', '~> 3.29'
  gem 'cucumber-rails', '~> 1.8', require: false
  gem 'database_cleaner', '~> 1.7'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
