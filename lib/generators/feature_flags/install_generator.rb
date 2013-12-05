
module FeatureFlags
  module Generators

    class MigrationNumber
      def self.next_migration_number
        unless @prev_migration_nr
          @prev_migration_nr = Time.now.utc.strftime("%Y%m%d%H%M%S").to_i
        else
          @prev_migration_nr += 1
        end
        @prev_migration_nr.to_s
      end
        
    end

    class InstallGenerator < Rails::Generators::Base

      source_root File.expand_path("../templates", __FILE__)
      desc "Creates feature_flags initializer, routes and copy locale
            files to your application."

      def create_initializer_file
        template "feature_flag.rb", "config/initializers/feature_flags.rb"
        #say("added initializer file", :green)
      end

      def setup_routes
        route "resources :feature_flags"
      end

      def copy_feature_migration
        template "feature_flag_migrate.rb", "db/migrate/#{MigrationNumber.next_migration_number}_create_features.rb"

        ##commented model file generation
        #template "feature_flag_model.rb", "app/models/feature.rb"
      end

    end
  end

end