module FeatureFlags
  module Generators

    class ViewsGenerator < Rails::Generators::Base

      source_root File.expand_path("../../../../app/views", __FILE__)
      desc "copies view files for feature_flags"

      def copy_views
        directory 'feature_flags', 'app/views/feature_flags'
      end
      
      desc "copies view files for feature_flags"
    end
  end

end
