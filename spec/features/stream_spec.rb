require 'spec_helper'
require 'vcr_config'

describe Jtv::Stream do
  describe '#summary', :vcr do
    it 'returns a summary of Jutstin.tv data' do
      summary = Jtv.summary
      expect(summary['streams_count']).to be > 0
    end
  end

  describe '#list', :vcr do
    it 'returns a list of streams for a category' do
      list = Jtv.list category: 'gaming'
      expect(list.count).to eq 50
      expect(list.first['category']).to match(/gaming/i)
    end
  end

  describe '#search', :vcr do
    it 'returns streams based on search query' do
      search = Jtv.search 'league of legends', limit: 10
      expect(search.count).to eq 10
      expect(search.first['category']).to eq 'gaming'
    end
  end
end
