require 'spec_helper'
require 'vcr_config'

describe Jtv::Stream do
  describe '#summary' do
    use_vcr_cassette

    it 'fetches a live channel' do
      summary = Jtv.summary channel: 'wingsofdeath'
      expect(summary['viewers_count']).to eq '14175'
    end
  end

  describe '#list' do
    use_vcr_cassette

    it 'returns a list of streams for a category' do
      list = Jtv.list category: 'gaming'
      expect(list.count).to eq 50
      expect(list.first['title']).to match(/wingsofdeath/i)
    end
  end

  describe '#search' do
    use_vcr_cassette

    it 'returns streams based on search query' do
      search = Jtv.search 'league of legends', limit: 10
      expect(search.count).to eq 10
      expect(search.first['category']).to eq 'gaming'
    end
  end
end