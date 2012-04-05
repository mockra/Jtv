class JtvChannel

  require 'jtv'

  attr_reader :viewers, :title, :url, :image_huge, :screen_cap_huge,
    :id, :about, :description, :embed, :blog, :facebook

  # Create a new channel object, this method should be passed the channel handle.
  # Example: channel = JtvChannel.new( 'day9tv' )
  def initialize(channel)
    client = Jtv::JtvClient.new
    json_data = client.get( "/channel/show/#{channel}.json" )

    data = JSON.parse json_data.body

    @id = channel
    @title = data['title']
    @url = data['channel_url']
    @image_huge = data['image_url_huge']
    @screen_cap_huge = data['screen_cap_url_huge']
    @about = data['about']
    @description = data['description']
    @embed = data['embed_code']
    @blog = data['blog']
    @facebook = data['facebook']
  end

  # Polls the Justin.TV API to find the number of current viewers on the channel.
  def viewers
    client = Jtv::JtvClient.new
    json_data = client.get( "/stream/list.json?channel=#{self.id}" )
    if json_data.body == "[]"
      return nil
    else
      data = JSON.parse( json_data.body )
    end
    data[0]['stream_count'].to_i
  end

end
