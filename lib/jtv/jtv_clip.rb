class JtvClip

  require 'jtv'

  attr_reader :description, :created_on, :length, :id, :title,
    :tags, :embed, :image_huge

  # Create a new clip object, this method should be passed the clip id.
  # Example: clip = JtvClip.new( 1894735 )
  def initialize(clip)

    client = Jtv::JtvClient.new
    json_data = client.get( "/clip/show/#{clip}.json" )

    data = JSON.parse json_data.body
    data = data[0]

    @description = data['description']
    @created_on = data['created_on']
    @length = data['length']
    @id = clip
    @title = data['title']
    @tags = data['tags']
    @embed = data['embed_code']
    @image_huge = data['image_url_huge']
  end

end
