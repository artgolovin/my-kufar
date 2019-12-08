require 'simplecov'
require 'cucumber/rails'
require_relative './forms/form'

ActionController::Base.allow_rescue = false

begin
  DatabaseCleaner.strategy = :transaction
rescue NameError
  raise "You need to add database_cleaner to your Gemfile (in the :test group) if you wish to use it."
end

Cucumber::Rails::Database.javascript_strategy = :truncation

World(FactoryBot::Syntax::Methods)

include Warden::Test::Helpers

Warden.test_mode!

After do
  Warden.test_reset!
end
