module Jtv
  module Configuration
    attr_accessor :consumer_key, :consumer_secret

    def configure
      yield self
    end
  end
end
