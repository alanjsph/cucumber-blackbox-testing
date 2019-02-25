require 'rspec'
require 'capybara/rspec'
require 'capybara/dsl'
require 'selenium-webdriver'

# loading page object files
# page_paths = File.join(Dir.pwd, 'spec', 'pages', '**', '*.rb')
# Dir.glob(page_paths).each { |file| require file }

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end

Capybara.javascript_driver = :selenium

Capybara.configure do |config|
  config.default_max_wait_time = 10 # seconds
  config.default_driver        = :selenium
  config.run_server = false
  config.app_host   = 'https://google.com'
end
include Capybara::DSL
