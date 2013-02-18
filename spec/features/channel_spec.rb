require 'spec_helper'
require 'vcr_config'

describe Jtv::Channel do
  describe '#fans' do
    use_vcr_cassette

    it 'fetches fans for a given channel' do
      fans = Jtv.fans id: 'officecam'
      expect(fans).to be_an Array
      expect(fans.first).to be_a Hash
      expect(fans.first['id']).to be_an Integer
    end
  end

  describe '#archives' do
    use_vcr_cassette

    it 'returns an array of archives for given channel' do
      archives = Jtv.archives id: 'dotahut', limit: 2
      expect(archives).to be_an Array
      expect(archives.count).to eq 2
      expect(archives.first['video_codec']).to eq 'AVC'
    end
  end

  describe '#channel_show' do
    use_vcr_cassette

    it 'provides information for a given channel' do
      channel = Jtv.channel_show 'apidemo'
      expect(channel['login']).to eq 'apidemo'
    end
  end

  describe '#embed' do
    use_vcr_cassette

    it 'returns a string containing an embed object' do
      embed = Jtv.embed 'justin', volume: 50
      expect(embed).to be_a String
      expect(embed).to include 'volume=50'
      expect(embed).to include 'object'
      expect(embed).to include 'x-shockwave-flash'
    end
  end

  describe '#chat_embed' do
    use_vcr_cassette

    it 'returns an iframe for chat' do
      chat = Jtv.chat_embed 'justin', height: 50
      expect(chat).to be_a String
      expect(chat).to include 'height:50px'
      expect(chat).to include 'iframe'
    end
  end
end
