module Lensman
  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end

  class Configuration
    attr_accessor :api_key, :url

    def initialize
      @api_key = ''
      @url = ''
    end
  end
end
