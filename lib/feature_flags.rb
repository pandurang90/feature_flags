require "feature_flags/version"
require "feature_flags/feature"
require "feature_flags/configuration"
Dir["/app/controllers/*.rb"].each {|file| require file }
Dir["/app/views/*.rb"].each {|file| require file }

module FeatureFlags
  # Your code goes here...
end
