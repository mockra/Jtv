class JtvChannel

  require 'jtv'

  attr_reader :viwers, :title, :url, :image_huge, :screen_cap_huge

  def initialize(channel)
    client = Jtv::JtvClient.new
    json_data = client.get( "/stream/list.json?channel=#{channel}" )

    if json_data.body == "[]"
      return nil
    else
      data = JSON.parse( json_data.body.gsub( /\[/, '' ).gsub( /\]/, '' ) )
    end

    @viewers = data['stream_count']
    @title = data['title']
    @url = data['channel']['channel_url']
    @image_huge = data['channel']['image_url_huge']
    @screen_cap_huge = data['channel']['screen_cap_url_huge']
  end

end
