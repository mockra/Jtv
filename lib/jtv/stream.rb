require 'uri'

module Jtv
  module Stream
    def summary params = {}
      get 'streams/summary.json', params
    end

    def featured params = {}
      get 'streams/featured.json', params
    end

    def search query, params = {}
      query = URI.escape query
      get "search/streams.json?q=#{query}", params
    end
  end
end
