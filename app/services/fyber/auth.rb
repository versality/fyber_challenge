require_relative 'core'

module Fyber
  class Auth < Fyber::Core
    def initialize
      super()

      authenticate
    end

    def authenticate
      @params.merge!(credentials)
    end

    protected

    def calculate_hashkey
      sorted_params     = @params.sort
      encoded_params    = URI.encode_www_form(sorted_params)

      digestible_params = "#{encoded_params}&#{ENV['API_KEY']}"

      Digest::SHA1.hexdigest(digestible_params)
    end

    private
    def credentials
      {
          appid: ENV['APP_ID']
      }
    end
  end
end
