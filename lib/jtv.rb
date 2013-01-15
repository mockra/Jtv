require "jtv/version"
require 'jtv/configuration'

module Jtv
  class << self
    include Jtv::Configuration
  end
end
