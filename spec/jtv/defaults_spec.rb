require_relative '../../lib/jtv/defaults'

class Client; include Jtv::Defaults; end

describe Jtv::Defaults do
  describe '#credentials' do
    before do
      Jtv.should_receive :consumer_key
      Jtv.should_receive :consumer_secret
    end

    it 'uses Jtv settings by default' do
      Jtv.should_receive :oauth_token
      Jtv.should_receive :oauth_secret
      Client.new.credentials
    end

    it 'uses set oauth values if available' do
      client = Client.new
      client.stub(:oauth_token) { 'token' }
      client.stub(:oauth_secret) { 'secret' }
      client.credentials
    end
  end
end
