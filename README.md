# Jtv [![Code Climate](https://codeclimate.com/github/mockra/Jtv.png)](https://codeclimate.com/github/mockra/Jtv) [![Build Status](https://travis-ci.org/mockra/Jtv.png?branch=master)](https://travis-ci.org/mockra/Jtv)

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
need to sign up for a [Justin.TV developer account](http://www.twitch.tv/login?auto=true&redirect_on_login=%2Fdeveloper%2Factivate).

Once you have your API Keys, you can set them up using the configuration guide
below.

## Configuration

```ruby
  Jtv.configure do |config|
    config.consumer_key = YOUR_CONSUMER_KEY
    config.consumer_secret = YOUR_CONSUMER_SECRET
  end
```

If you want to make requests on behalf of a specific user, then you need to
instantiate a client.

```ruby
  @client = Jtv::Client.new oauth_token: 'users_token',
    oauth_secret: 'users_secret'
```

## Usage

The Jtv gem offers various methods depending on the type of information
you're looking for.

It's recommended to cache your requests, and to always keep your
account's rate limit in mind.

Check out the [RDOC](http://rubydoc.info/github/Mockra/Jtv/).

### Stream

#### Summary

Returns aggregate stream information for all live channels (possibly scoped by
category).

```ruby
  Jtv.summary
  # {"average_bitrate"=>0, "streams_count"=>4346, "viewers_count"=>"142733"}

  Jtv.summary channel: 'mockra'
  # {"average_bitrate"=>0, "streams_count"=>0, "viewers_count"=>0}
```

You can include a channel, language, or category in your search params.

#### List

Returns stream information for all live channels. The results are sorted by the
current number of viewers, with the most popular channels first.

```ruby
  Jtv.list category: 'gaming', limit: 1
  # [{'name' => 'live_user_wingsofdeath'...}]
```

You can include a channel, category, title, language, limit, and offset.

#### Search

Returns stream information for the live channels that match a search query. The
results are sorted by the current number of viewers, with the most popular
channels first.

```ruby
  Jtv.search 'gaming', limit: 1
  # [{'name' => 'live_user_steven_bonnell_ii'...}]
```

The first argument is your search query, and you can also pass limit and offset
as params.

### User

#### Show

Returns extended information for a user, specified by user id or login.

```ruby
  Jtv.user_show 'mockra'
  # {"id"=>22056792...}
```

Pass in a user's login.

#### Favorites

Get all channels who are favorites of a user.

```ruby
  Jtv.favorites 'mockra'
  # [{}]
```

Pass in a user's login.

### Channel

#### Show

Returns extended information for a channel, specified by channel id or login.
Requires OAuth authentication for private channels.

```ruby
  Jtv.channel_show 'apidemo'
  # {'login'=>'apidemo'...}
```

Pass in a login or id for the channel.

#### Fans

Get users who are fans of a channel. Requires OAuth authentication for private
channels.

```ruby
  Jtv.fans id: 'officecam'
  # [{'id'=>23}]
```

Login must be included for the channel. Optional limit and offset params
(defaults are 20 for limit and 0 for offset). Results returned are limited to
100. Results are returned in create date order.

#### Archives

Get archives from a given channel. Requires OAuth authentication for private
channels.

```ruby
  Jtv.archives id: 'dotahut', limit: 2
  # [{'video_codec' => 'AVC'}, {}]
```

channel id or login must be included as a param. Optional limit and offset
params (defaults are 20 for limit and 0 for offset). Results returned are
limited to 100. Results are returned in create date order

#### Embed

Get embed code for a channel.

```ruby
  Jtv.embed 'justin', volume: 50
  # "<object></object>"
```

You can supply params volume, publisher_guard (for the default channel password
to try), height, width, and watermark_position

#### Chat Embed

Get chat embed code for a channel.

```ruby
  Jtv.chat_embed 'justin', height: 1000
  # "<iframe></iframe>"
```

You can supply params height and width.

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
