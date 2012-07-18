# Ruby::Irail

IRail makes Belgian railway schedule easily available for anyone.

Check it out on [http://project.irail.be/](http://project.irail.be/) or [http://data.irail.be/](http://data.irail.be/)

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
require "ruby-irail"

# get a list of all mivb/stib stations in brussels

irail = IRail::API.new(:stib) # use :mivb symbol instead of :stib if you want
irail.stations

# get a list of all belgian train stations

irail          = IRail::API.new # by default it takes the nmbs/sncb provider but you can also use :sncb or :nmbs symbols
train_stations = irail.stations

# get train trips from one station to another

origin      = train_stations.first
destination = train_stations.last
irail.connections(origin, destination)

#get train trip information (all stops for a train)

irail.vehicle("BE.NMBS.IC2240") # the vehicle ids cans be found when querying for a connection
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
