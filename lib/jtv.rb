require "jtv/version"
require 'jtv/jtv_channel'
require 'jtv/jtv_clip'

require 'json'

module Jtv

  require 'oauth'

  def self.channel_viewers( channel )
    client = Jtv::JtvClient.new
    json_data = client.get( "/stream/list.json?channel=#{channel}" )
    if json_data.body == "[]"
      return nil
    else
      data = JSON.parse( json_data.body )
    end
    data[0]['stream_count'].to_i
  end

  class JtvClient

    # Set API Keys through environment variables.
    CONSUMER_KEY = ENV['JTV_CONSUMER_KEY']
    CONSUMER_SECRET = ENV['JTV_CONSUMER_SECRET']

    def initialize
      @consumer = OAuth::Consumer.new(
        CONSUMER_KEY,
        CONSUMER_SECRET,
        :site => "http://api.justin.tv",
        :http_method => :get
      )
    end

    def get(path, access_token=nil)
      (access_token || default_token).get("/api#{path}")
    end

    def post(path, post_params, access_token=nil)
      (access_token || default_token).post("/api#{path}", post_params)
    end

    def make_request_token
      @consumer.get_request_token
    end

    def exchange_request_token_for_access_token(request_token)
      request_token.get_access_token
    end

    private
    def default_token
      OAuth::AccessToken.new @consumer
    end
  end

end
