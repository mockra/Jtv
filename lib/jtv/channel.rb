module Jtv
  module Channel
    def channel_show id
      get "channel/show/#{id}.json"
    end

    def fans params = {}
      get 'channel/fans', params
    end

    def archives params = {}
      get 'channel/archives', params
    end

    def embed id, params = {}
      request(:get, "channel/embed/#{id}", params)[:body]
    end

    def chat_embed id, params = {}
      request(:get, "channel/chat_embed/#{id}", params)[:body]
    end
  end
end
