# initializer
# set configuration options.
FeatureFlags.configure do |config|
  config.template = "your_app_template"
  config.filters = %w(abc,abcd)
end