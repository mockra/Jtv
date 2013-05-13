module Jtv
  module Channel
    def channel_show id
      get "channel/show/#{id}.json"
    end

    def fans params = {}
      id = params[:id] || params[:channel]
      get "channel/fans/#{id}.json", params
    end

    def archives params = {}
      id = params[:id] || params[:channel]
      get "channel/archives/#{id}.json", params
    end

    def embed id, params = {}
      request(:get, "channel/embed/#{id}", params)[:body]
    end

    def chat_embed id, params = {}
      request(:get, "channel/chat_embed/#{id}", params)[:body]
    end
  end
end
