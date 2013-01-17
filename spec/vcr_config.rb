require 'vcr'
require 'fakeweb'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/vcr_cassettes'
  c.hook_into :fakeweb
end

RSpec.configure do |c|
  c.extend VCR::RSpec::Macros
end
