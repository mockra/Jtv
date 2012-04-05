class JtvSearch

  require 'jtv'

  attr_reader :viewers, :title, :url, :image_huge, :screen_cap_huge, :id

  # Creates a new JtvSearch object
  def initialize( stream )
    @viewers = stream['stream_count']
    @title = stream['title']
    @url = stream['channel']['channel_url']
    @image_huge = stream['channel']['image_url_huge']
    @screen_cap_huge = stream['channel']['screen_cap_url_huge']
    @id = stream['channel']['login']
  end
  
  # Returns an array of objects based on search paramaters,
  # pass the desired query, as well as an optional limit up to 100
  def self.get( query, limit=20 )
    client = Jtv::JtvClient.new
    query.gsub!( /[ ]/, '%20' )
    json_data = client.get( "/stream/search/#{query}.json?limit=#{limit}" )

    data = JSON.parse json_data.body
    search_array = Array.new

    data.each do |stream|
      search_array << JtvSearch.new( stream )
    end

    search_array
  end

end
