module Jtv
  module Defaults
    attr_accessor :oauth_token, :oauth_secret

    def credentials
      { consumer_key: Jtv.consumer_key,
        consumer_secret: Jtv.consumer_secret,
        token: oauth_token || Jtv.oauth_token,
        token_secret: oauth_secret || Jtv.oauth_secret }
    end

  private

    def options
      { headers: {
          accept: 'application/json',
          user_agent: 'Jtv Gem' },
        request: {
          open_timeout: 2,
          timeout: 5 } }
    end
  end
end
