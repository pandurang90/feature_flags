module Generators
  class InstallGenerator < Rails::Generators::Base
    
    def create_initializer_file
      create_file "config/initializers/feature_flag.rb", "validate_for_something=%w['abc','abcd']"
    end

  end
end