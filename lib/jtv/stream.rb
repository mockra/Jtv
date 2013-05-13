require 'uri'

module Jtv
  module Stream
    def summary params = {}
      get 'stream/summary.json', params
    end

    def list params = {}
      get 'stream/list.json', params
    end

    def search query, params = {}
      query = URI.escape query
      get "stream/search/#{query}.json", params
    end
  end
end
