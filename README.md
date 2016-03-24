# RailsDefaultValue

Assign default values to Model fields in your Rails apps.

Other solutions for assigning default values tend to be at the database layer in migrations. If you prefer to keep your model logic in your model code, use 'rails_default_value'.

## Installation

Add this line to your application's Gemfile:

    gem 'rails_default_value'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rails_default_value

## Usage

    class MyModel < ActiveRecord::Base
      #...
      default :field_name => 'some value'
      default :some_other_field_name => :another_value
      default :some_time_based_field_name => -> { Time.now + 14.days }
    end

## Contributing

1. Fork it ( https://github.com/keithrowell/rails_default_value/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
