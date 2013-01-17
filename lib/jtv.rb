require "jtv/version"
require 'jtv/configuration'
require 'jtv/client'

module Jtv
  class << self
    include Jtv::Configuration

    def client
      @client ||= Jtv::Client.new
    end

    def respond_to_missing?(method_name, include_private=false)
      client.respond_to?(method_name, include_private) || super
    end

  private

    def method_missing method_name, *args, &block
      return super unless client.respond_to?(method_name)
      client.send(method_name, *args, &block)
    end
  end
end
