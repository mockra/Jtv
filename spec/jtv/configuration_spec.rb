require_relative '../../lib/jtv/configuration'
module Jtv
  class << self
    include Jtv::Configuration
  end
end

describe Jtv::Configuration do
  describe '.configure' do
    it 'provides configuration for a module' do
      Jtv.configure do |config|
        config.consumer_key = 'key'
        config.consumer_secret = 'secret'
      end
      expect(Jtv.consumer_secret).to eq 'secret'
      expect(Jtv.consumer_key).to eq 'key'
    end
  end
end
