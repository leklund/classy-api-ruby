require 'faraday'

module Classy
  module Configuration

    VALID_CONFIG_KEYS = [
      :cid,
      :token,
      :endpoint,
      :format,
      :user_agent,
      :adapter
    ].freeze

    DEFAULT_CID = nil
    DEFAULT_TOKEN = nil
    DEFAULT_ENDPOINT = 'https://classy.com/api'
    DEFAULT_FORMAT = 'json'
    DEFAULT_USER_AGENT = ''
    DEFAULT_ADAPTER = Faraday.default_adapter

    attr_accessor *VALID_CONFIG_KEYS

    def self.extended(base)
      base.reset
    end

    def configure
      yield self
    end

    def options
      VALID_CONFIG_KEYS.inject({}) do |opt, key|
        opt.merge!(key => send(key))
      end
    end

    def reset
      self.cid        = DEFAULT_CID
      self.token      = DEFAULT_TOKEN
      self.endpoint   = DEFAULT_ENDPOINT
      self.format     = DEFAULT_FORMAT
      self.user_agent = DEFAULT_USER_AGENT
      self.adapter    = DEFAULT_ADAPTER
    end
  end
end
