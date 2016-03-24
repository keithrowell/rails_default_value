require 'rails_default_value'
# require 'supermodel'
require 'acts_as_fu'


RSpec.configure do |config|
  puts "include ActsAsFu"
  config.include ActsAsFu
end