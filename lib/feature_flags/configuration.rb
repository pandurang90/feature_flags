module FeatureFlags
  class Configuration
    attr_accessor :template, :filters

    def initialize
      template = nil
      filters = []
    end
    
  end

  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration) if block_given?
  end
end