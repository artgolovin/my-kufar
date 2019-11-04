Kaminari.configure do |config|
  config.default_per_page = ENV.fetch('PAGINATES_PER', 10).to_i
  config.window = 4
end
