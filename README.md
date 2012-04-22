# Jtv

This gem allows you to quickly add Justin.TV integration to your Ruby applications. Jtv is a useful tool for providing a list of livestreams, as well as embedding Justin.TV streams and clips.

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

The Jtv gem offers various classes depending on the type of information
you're looking for. JtvChannel and JtvClip should be used for creating records. 
Jtv methods should be used for updating records.

It's reccomended to cache your requests, and to always keep your
account's rate limit in mind.

Check out the [RDOC](http://rubydoc.info/github/Mockra/Jtv/).

### Jtv

```ruby
Jtv.channel_viewers( 'channel_handle' )
```

This method will return nil if the stream is offline. Use this
method for providing realtime viewer numbers and stream status.

### JtvSearch

The JtvSearch provides access to the search api. If you pass
JtvSearch.get a search query, it will return an array of channels.
This class makes it easy to include a generic livestream list for your
website.

```ruby
streams = JtvSearch.get( 'league of legends', 50 )
# You can pass the get method a search query, as well as
# an optional stream limit that goes up to 100 and defaults to 20

streams.each do |stream|

  stream.id
  stream.title
  stream.url
  stream.viewers
  stream.image_huge
  stream.screen_cap_huge

end

# This will return an Array sorted by viewer count
```

### JtvChannel

The JtvChannel class provides access to stream information for a
specific channel. You'll need to pass the channel handle when you
initialize your object.

```ruby
channel = JtvChannel.new( 'channel_handle' )
```

You'll then have access to the following information.

```ruby
channel.viewers
# Number of current viewers on the stream, requires a second API call
# If the stream is offline, this will return nil

Jtv.channel_viewers( 'channel_handle' )
# This will return nil for offline streams.
# Use this method for updating current viewers

channel.image_huge
# 320x240 Image URL

channel.screen_cap_huge
# 320x240 Screen Capture URL

channel.id
# The channel handle

channel.embed
#Code required to embed the Justin.TV Player, response looks like:
```

```
<object type="application/x-shockwave-flash" height="295" width="353" id="jtv_player_flash" data="http://www.justin.tv/widgets/jtv_player.swf?channel=apidemo&quot; bgcolor="#000000"><param name="allowFullScreen" value="true" /><param name="allowscriptaccess" value="always" /><param name="movie" value="http://www.justin.tv/widgets/jtv_player.swf&quot; /><param name="flashvars" value="channel=apidemo&auto_play=false&start_volume=25" /></object>
```

```ruby
channel.title
channel.url
channel.about
channel.description
```

### JtvClip

The JtvClip class provides access to specific clip information. To
create a clip object, simply pass the clip id when you initialize the
object.

```ruby
clip = JtvClip.new( 1278312 )
```

The following method calls are available through the Clip class.

```ruby
clip.description
clip.title
clip.id
clip.tags
clip.embed
clip.image_huge
clip.length
clip.created_on
```

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
