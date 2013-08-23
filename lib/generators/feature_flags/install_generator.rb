
module Generators
  class InstallGenerator < Rails::Generators::Base

    desc "Creates feature_flags initializer, routes and copy locale
          files to your application."
          
    def create_initializer_file
      create_file "config/initializers/feature_flag.rb", Install.content_for_initializer
      template "../templates/feature_flag.rb", "config/initializers/feature_flags.rb"
    end

    def setup_routes
      route "resources :feature_flags"
    end


    def copy_feature_migration
      migration_template "../templates/feature_flag_migrate.rb", "db/migrate/create_table_feature_flags"
    end


  end
end