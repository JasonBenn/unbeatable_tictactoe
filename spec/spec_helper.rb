require 'simplecov'
SimpleCov.start

require 'rspec'
require_relative '../config/environment'

RSpec.configure do |config|
  config.order = "random"
end
