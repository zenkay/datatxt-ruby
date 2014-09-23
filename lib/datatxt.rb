require "datatxt/version"
require "datatxt/nex"

module Datatxt

  def self.configure(&block)
    yield @config ||= Configuration.new
  end

  def self.config
    @config
  end

  class Configuration
    attr_accessor :app_id, :app_key, :endpoint
  end

  class BadResponse < Exception; end
end
