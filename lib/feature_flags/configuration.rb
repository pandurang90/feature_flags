module FeatureFlags
  class Configuration
    attr_accessor :layout, :filters

    def initialize
      layout = "application"
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