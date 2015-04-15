module Classy
  class API
    attr_accessor *Configuration::VALID_CONFIG_KEYS

    def initialize(opts = {})
      opts = Classy.options.merge(opts)

      Configuration::VALID_CONFIG_KEYS.each do |k|
        send("#{k}=", opts[k])
      end
    end
    # Your code goes here...
  end
end
