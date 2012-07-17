# Ruby::Irail

IRail makes Belgian railway schedule easily available for anyone.

There are already several wrappers available in different languages. This is a Ruby wrapper for their API.

## Installation

Add this line to your application's Gemfile:

    gem 'ruby-irail'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ruby-irail

## Usage

```ruby
# get a list of all belgian train stations

require "ruby-irail"
irail = IRail::API.new
irail.stations
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

### Running the tests

All tests are in the specs folder. To run them simply run the following from the root folder of your fork:

```ruby
rspec
```

### Contributors

Marc Lainez (@mlainez)
