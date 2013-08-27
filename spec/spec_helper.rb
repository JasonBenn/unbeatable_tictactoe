require 'simplecov'
SimpleCov.start

require 'rspec'

Rspec.configure do |config|
  config.order = "random"
end
