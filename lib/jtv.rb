require "jtv/version"
require 'jtv/jtv_channel'

require 'json'

module Jtv

  require 'oauth'

  # Usage:
  # Two legged:
  # jtv_client = JtvClient.new("XXXXXXXXX", "XXXXXXXXXXXXX")
  # response = jtv_client.get("/user/show/apidemo.xml")
  # if response.is_a?(Net::HTTPOK)
  #   puts response.body
  # end


  class JtvClient

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

    # Parameters
    # "path" like /user/show/apidemo.xml
    # "access_token" like OAuth::AccessToken
    #    (Alternatively, "user" may .respond_to? each key instead)
    def get(path, access_token=nil)
      (access_token || default_token).get("/api#{path}")
    end

    # Parameters
    # "path" like /stream/register_callback.xml
    # "post_params" like {:event => "stream_up", :channel => "apidemo", :callback_url => ""}
    # "access_token" like OAuth::AccessToken
    #    (Alternatively, "user" may .respond_to? each key instead)
    def post(path, post_params, access_token=nil)
      (access_token || default_token).post("/api#{path}", post_params)
    end

    # Create a request token to be authorized
    # You will send the user to request_token.authorize_url("http://www.my-api-site.com/on_authorize")
    # which will redirect them to your site and add ?oauth_token=XXXXXXXXXXX
    def make_request_token
      @consumer.get_request_token
    end

    # When a user arrives at http://www.my-api-site.com/on_authorize?oauth_token=XXXXXXXXX, look up
    # the request token you had before, and then exchange it for an access token
    def exchange_request_token_for_access_token(request_token)
      request_token.get_access_token
    end

    private
    def default_token
      OAuth::AccessToken.new @consumer
    end
  end

end
