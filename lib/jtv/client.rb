require 'simple_oauth'
require 'faraday'
require 'jtv/defaults'

module Jtv
  class Client
    include Jtv::Defaults

    def initialize args = {}
      args.each do |key, value|
        send "#{key}=", value
      end
    end

    def get path, params = {}
      request :get, path, params
    end

  private

    def request method, path, params = {}
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
