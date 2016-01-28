require 'spec_helper'

describe Fyber::Auth do
  describe '#calculate_hashkey' do
    it 'returns correct hashkey' do
      params = {
        one: 'one',
        two: 'two',
        three: 'three',
        four: 'four'
      }

      fyber_auth = subject
      fyber_auth.instance_variable_set(:@params, params)

      sorted_params     = params.sort
      encoded_params    = URI.encode_www_form(sorted_params)
      digestible_params = "#{encoded_params}&#{ENV['API_KEY']}"
      test_hashkey      = Digest::SHA1.hexdigest(digestible_params)
      hashkey           = fyber_auth.send(:calculate_hashkey)

      expect(test_hashkey).to eq(hashkey)
    end
  end
end