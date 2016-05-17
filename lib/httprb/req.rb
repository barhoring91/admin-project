require 'http'
module Httprb
  class Req
    def self.fuck
      HTTP.get('https://www.foaas.com/off/Tom/Chris')
    end
  end
end