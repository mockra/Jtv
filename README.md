# Jtv

This gem allows you to quickly add Justin.TV integration to your Ruby applications.

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

Once you have your API Keys, you'll need to set them up as environment
variables for them to work with this gem. A great article on environment
variables can be found at [Heroku](https://devcenter.heroku.com/articles/config-vars).

``` ruby
ENV['JTV_CONSUMER_KEY']
ENV['JTV_CONSUMER_SECRET']
```

## Usage

### JtvChannel
The JtvChannel class provides access to stream information for a
specific channel. You'll need to pass the channel handle when you
initialize your object.

``` ruby
channel = JtvChannel.new( 'channel' )
```

You'll then have access to the following information; however, if a
stream is offline, these values will return nil.

``` ruby
channel.viewers
# Number of current viewers on the stream

channel.title
# Title of the channel

channel.url
# The channel's URL

channel.image_huge
# 320x240 Image URL

channel.screen_cap_huge
# 320x240 Screen Capture URL
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Contact

[david@mockra.com](mailto:david@mockra.com)
[@Mockra_](http://twitter.com/#!/mockra_)
[mockra.com](http://mockra.com)
