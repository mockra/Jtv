module Jtv
  module Defaults
    attr_accessor :oauth_token, :oauth_secret

    def credentials
      { consumer_key: Jtv.consumer_key,
        consumer_secret: Jtv.consumer_secret,
        token: oauth_token || Jtv.oauth_token,
        token_secret: oauth_secret || Jtv.oauth_secret }
    end

  end
end
