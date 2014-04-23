# ActOn

A small ruby wrapper around [Act-On](http://www.act-on.com)'s api.

## Installation

Add this line to your application's Gemfile:

    gem 'act-on'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install acton

## Usage

```ruby
ActOn.configure do |config|
  config.url = "https://restapi.actonsoftware.com"
  config.access_token = "1234567890"
end
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request



