require_relative '../../lib/jtv/defaults'

class Client; include Jtv::Defaults; end

describe Jtv::Defaults do
  describe '#credentials' do
    before do
      expect(Jtv).to receive(:consumer_key)
      expect(Jtv).to receive(:consumer_secret)
    end

    it 'uses Jtv settings by default' do
      expect(Jtv).to receive(:oauth_token)
      expect(Jtv).to receive(:oauth_secret)
      Client.new.credentials
    end

    it 'uses set oauth values if available' do
      client = Client.new
      allow(client).to receive(:oauth_token).and_return 'token'
      allow(client).to receive(:oauth_secret).and_return 'secret'
      client.credentials
    end
  end
end
