# FeatureFlags

Manage (turn on/off) different features in your rails app.

## Installation

Add this line to your application's Gemfile:

    gem 'feature_flags'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install feature_flags

## Usage

with faeture_flags gem you can easily manage different features in your rails application.You can turn on/off features.

    rails generate feature_flags:install

this will generate 3 files,
1) initializer file in config/initializer/feature_flags.rb
2) migration file for Feature model
3) Feature.rb 
then do 
    
    rake db:migrate
    


To check whether paritcular feature is enabled or not use

    FeatureFlags.enabled?(:feature_name)

this will check whether feature is enabled or not, and if its not present/created ,it will create that feature and set it to enabled by default.




    FeatureFlags.set_disabled?(:feature_name)

this will disable mentioned feature in your rails application.    


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
