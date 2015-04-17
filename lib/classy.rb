require_relative 'classy/version'
require_relative 'classy/configuration'
require_relative 'classy/api'
require_relative 'classy/client'


module Classy
  extend Configuration

  def self.client(options={})
    Classy::Client.new(options)
  end
end
