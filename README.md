# Jtv

This library provides a complete wrapper for the Justin.TV and Twitch.TV APIs.

## Installation

Add this line to your application's Gemfile:

    gem 'jtv'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install jtv

## Justin.TV API Keys

If you want access to higher rate limits for your application, then you
need to sign up for a [Justin.TV developer account](http://www.justin.tv/developer/activate).

Once you have your API Keys, you can set them up using the configuration guide
below.

## Configuration

```ruby
  Jtv.configure do |config|
    config.consumer_key = YOUR_CONSUMER_KEY
    config.consumer_secret = YOUR_CONSUMER_SECRET
  end
```

## Usage

The Jtv gem offers various methods depending on the type of information
you're looking for.

It's recommended to cache your requests, and to always keep your
account's rate limit in mind.

Check out the [RDOC](http://rubydoc.info/github/Mockra/Jtv/).

### Jtv

## Contributing

Contributions and feedback are more than welcome and highly encouraged.

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Contact

[david@mockra.com](mailto:david@mockra.com)

[@Mockra_](http://twitter.com/#!/mockra_)

[mockra.com](http://mockra.com)
