# spec/spec_helper.rb
require_relative 'vcr_helpers'
require 'rack/test'
require 'rspec'
require 'capybara/rspec'
require 'vcr'

include VcrHelpers

ENV['RACK_ENV'] = 'test'

require File.expand_path '../../config/environment.rb', __FILE__

module RSpecMixin
  include Rack::Test::Methods
end

def app() Sinatra::Application end
Capybara.app = app

RSpec.configure do |c|
  c.include RSpecMixin
end

VCR.configure do |c|
  c.cassette_library_dir = 'spec/cassettes'
  c.hook_into :webmock
  c.configure_rspec_metadata!
end