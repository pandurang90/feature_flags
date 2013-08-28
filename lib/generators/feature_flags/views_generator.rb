
module FeatureFlags
  module Generators

    class ViewsGenerator < Rails::Generators::Base

      source_root File.expand_path("../../../../app/views/feature_flags", __FILE__)
      desc "copies view files for feature_flags"

      def copy_views_file
        template "index.html.erb", "app/views/feature_flags/index.html.erb"
        template "edit.html.erb", "app/views/feature_flags/edit.html.erb"
        template "update.html.erb", "app/views/feature_flags/update.html.erb"
        template "new.html.erb", "app/views/feature_flags/new.html.erb"
        #say("added initializer file", :green)
      end

    end
  end

end