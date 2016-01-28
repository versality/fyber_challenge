module Fyber
  class Core
    BASE_URL = 'http://api.fyber.com/feed'
    VERSION = 'v1'

    def initialize
      @url    = construct_url
      @params = blank_params
    end

    protected

    def construct_url
      "#{BASE_URL}/#{VERSION}"
    end

    def blank_params
      {}
    end

    def generate_timestamp
      Time.now.to_i
    end
  end
end
