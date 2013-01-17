require 'simple_oauth'
require 'json'
require 'faraday'
require 'jtv/defaults'
require 'jtv/stream'

module Jtv
  class Client
    include Jtv::Defaults
    include Jtv::Stream

    def initialize args = {}
      args.each do |key, value|
        send "#{key}=", value
      end
    end

    def get path, params = {}
      get_json :get, path, params
    end

  private

    def get_json method, path, params
      response = request(method, path, params)
      JSON.parse response[:body]
    end

    def request method, path, params
      connection.send method, path, params do |req|
        req.headers[:authorization] = req_header(method, path, params).to_s
      end.env
    end

    def connection
      @connection ||= Faraday.new 'http://api.justin.tv', options
    end

    def req_header method, path, params
      uri = URI "http://api.justin.tv#{path}"
      SimpleOAuth::Header.new method, uri, params, credentials
    end
  end
end
