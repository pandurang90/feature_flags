module FeatureFlags  
  class Engine < ::Rails::Engine
    isolate_namespace FeatureFlags
  end
end