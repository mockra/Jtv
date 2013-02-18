require 'spec_helper'
require 'vcr_config'

describe Jtv::Channel do
  describe '#fans', :vcr do
    it 'fetches fans for a given channel' do
      fans = Jtv.fans id: 'officecam'
      expect(fans).to be_an Array
      expect(fans.first).to be_a Hash
      expect(fans.first['id']).to be_an Integer
    end
  end

  describe '#archives', :vcr do
    it 'returns an array of archives for given channel' do
      archives = Jtv.archives id: 'dotahut', limit: 2
      expect(archives).to be_an Array
      expect(archives.count).to eq 2
      expect(archives.first['video_codec']).to eq 'AVC'
    end
  end

  describe '#channel_show', :vcr do
    it 'provides information for a given channel' do
      channel = Jtv.channel_show 'apidemo'
      expect(channel['login']).to eq 'apidemo'
    end
  end

  describe '#embed', :vcr do
    it 'returns a string containing an embed object' do
      embed = Jtv.embed 'justin', volume: 50
      expect(embed).to be_a String
      expect(embed).to include 'volume=50'
      expect(embed).to include 'object'
      expect(embed).to include 'x-shockwave-flash'
    end
  end

  describe '#chat_embed', :vcr do
    it 'returns an iframe for chat' do
      chat = Jtv.chat_embed 'justin', height: 50
      expect(chat).to be_a String
      expect(chat).to include 'height:50px'
      expect(chat).to include 'iframe'
    end
  end
end
