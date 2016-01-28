module VcrHelpers
  def without_timestamp_and_hashkey
    {
        match_requests_on: [:method, VCR.request_matchers.uri_without_param(:timestamp, :hashkey)]
    }
  end
end