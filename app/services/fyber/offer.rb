require_relative 'auth'
require_relative 'validation'
require 'json'
require 'net/http'

module Fyber
  class Offer < Fyber::Auth
    include Fyber::Validation

    ENDPOINT = 'offers.json'

    def initialize(device_id)
      super()

      validate_device_id(device_id)
      @params[:device_id] = device_id

      construct_endpoint
    end

    def fetch(options)
      validate_options(options)
      @params.merge!(options)

      perform_request
    end

    private

    def construct_endpoint
      "#{@url}/#{ENDPOINT}"
    end

    def perform_request
      prepare_request
      url       = construct_endpoint
      uri       = URI(url)
      uri.query = URI.encode_www_form(@params)
      res       = Net::HTTP.get_response(uri)

      response_body = JSON.parse(res.body)

      if response_body['code'] == 'OK'
        response_body['offers']
      else
        false
      end
    end

    def prepare_request
      @params[:timestamp] = generate_timestamp
      hashkey             = calculate_hashkey
      @params[:hashkey]   = hashkey
    end
  end
end
