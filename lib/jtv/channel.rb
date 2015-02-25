module Jtv
  module Channel
    def channel_show id
      get "channels/#{id}.json"
    end

    def fans params = {}
      # authenticated
      id = params[:id] || params[:channel]
      get "channels/#{id}/follows.json", params
    end

    def archives params = {}
      id = params[:id] || params[:channel]
      get "channels/#{id}/videos.json", params
    end
  end
end
