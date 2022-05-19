# OkcoinClient

An API wrapper for Okcoin.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'okcoin_client'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install okcoin_client

## Usage

```ruby
client = OkcoinClient.new(host: "host", key: "key", secret: "secret", passphrase: "passphrase")

# Get orders
response = client.get_orders(instrument_id: "instrument_id", state: 7, limit: 5)
```

## Development

```
cp spec/config.yml{.sample,}
rspec
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/bloom-solutions/okcoin_client-ruby. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/bloom-solutions/okcoin_client-ruby/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the OkcoinClient project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/bloom-solutions/okcoin_client-ruby/blob/master/CODE_OF_CONDUCT.md).
