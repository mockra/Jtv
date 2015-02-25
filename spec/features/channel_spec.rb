require 'spec_helper'
require 'vcr_config'

describe Jtv::Channel do
  describe '#fans', :vcr do
    it 'fetches fans for a given channel' do
      fans = Jtv.fans id: 'officecam'
      expect(fans['follows']).to be_an Array
      expect(fans['follows'].first).to be_a Hash
      expect(fans['follows'].first['user']['_id']).to be_an Integer
    end
  end

  describe '#archives', :vcr do
   it 'returns an array of archives for given channel' do
      archives = Jtv.archives channel: 'test_channel', limit: 2
      expect(archives['videos']).to be_an Array
      expect(archives['videos'].count).to eq 2
      expect(archives['videos'].first['broadcast_type']).to eq 'highlight'
    end
  end

  describe '#channel_show', :vcr do
    it 'provides information for a given channel' do
      channel = Jtv.channel_show 'apidemo'
      expect(channel['display_name']).to eq 'Apidemo'
    end
  end
end
