require_relative '../../lib/jtv/configuration'

describe Jtv::Configuration do
  describe '.configure' do
    it 'provides access to writer methods' do
      Jtv::Configuration.configure do |config|
        config.consumer_key = 'key'
        config.consumer_secret = 'secret'
      end
      expect(Jtv::Configuration.consumer_secret).to eq 'secret'
      expect(Jtv::Configuration.consumer_key).to eq 'key'
    end
  end
end
