require 'rails'
require "feature_flags/version"
require "feature_flags/feature"
require "feature_flags/configuration"

require "active_support/dependencies"

module FeatureFlags
  # Your code goes here...\
  mattr_accessor :app_root

end
