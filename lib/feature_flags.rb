
require "feature_flags/version"
require "feature_flags/configuration"
require "feature_flags/manage_features"
require "feature_flags/engine"
require "active_support/dependencies"
require "feature_flags/feature_base"
require 'pstore'
require 'feature_flags/storage'

module FeatureFlags
  # Your code goes here...\
	FeatureFlags.update_pstore_value
end
