# ActOn

A small ruby wrapper around [Act-On](http://www.act-on.com)'s api.

## Installation

Add this line to your application's Gemfile:

    gem 'act-on'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install act-on

## Usage

```ruby
require 'act-on'

ActOn.configure do |config|
  config.url = "https://restapi.actonsoftware.com"
  config.client_id = "YOUR-CLIENT-ID"
  config.client_secret = "YOUR-CLIENT-SECRET"
  config.username = "YOUR-USERNAME"
  config.password = "YOUR-PASSWORD"
end

client = ActOn.client
token = client.authenticate
client.lists
client.create_contact("your-list-id", {"first_name" => "Chris", "last_name" => "Petersen", "email" => "cpetersen@assaydepot.com" })
```

## Gotcha's

I setup my list(s) through Act-On's UI. The contact keys of the hash you pass to `create_contact` should match the column names you setup there.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request



