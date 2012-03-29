class JtvChannel

  require 'jtv'

  attr_reader :viewers, :title, :url, :image_huge, :screen_cap_huge,
    :id, :about, :description, :embed, :blog, :facebook

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

  def viewers
    client = Jtv::JtvClient.new
    json_data = client.get( "/stream/list.json?channel=#{self.id}" )
    if json_data.body == "[]"
      return 0
    else
      data = JSON.parse( json_data.body )
    end
    data[0]['stream_count'].to_i
  end

end
