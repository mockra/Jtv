module Jtv
  module Configuration
    class << self
      attr_accessor :consumer_key, :consumer_secret

      def configure
        yield self
      end
    end
  end
end
