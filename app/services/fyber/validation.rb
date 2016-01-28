class MissingUid < StandardError;
end
class MissingLocale < StandardError;
end

module Fyber
  module Validation
    def validate_options(options)
      unless options.is_a? Hash
        raise TypeError, 'options must be a hash.'
      end

      unless options.has_key? :uid
        raise MissingUid, "options must contain 'uid' param."
      end

      unless options.has_key? :locale
        raise MissingLocale, "options must contain 'locale' param."
      end

      # TODO
      # Validate the following:
      # IP address
      # Locale types
      # Page
    end

    def validate_device_id(device_id)
      unless device_id.is_a? String
        raise TypeError, 'device_id must be a string.'
      end
    end
  end
end