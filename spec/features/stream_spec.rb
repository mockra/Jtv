require 'spec_helper'
require 'vcr_config'

describe Jtv::Stream do
  describe '#summary', :vcr do
    it 'returns a summary of Justin.tv data' do
      summary = Jtv.summary
      expect(summary['viewers']).to be > 0
    end
  end

  describe '#featured', :vcr do
    it 'returns a list of streams' do
      list = Jtv.featured
      expect(list['featured'].count).to eq 25
    end
  end

  describe '#search', :vcr do
    it 'returns streams based on search query' do
      search = Jtv.search 'starcraft'
      expect(search['_total']).to be > 0
    end
  end
end
