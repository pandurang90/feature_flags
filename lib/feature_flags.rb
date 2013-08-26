
require "feature_flags/version"
require "feature_flags/configuration"
require "feature_flags/engine"
require "active_support/dependencies"

module FeatureFlags
  # Your code goes here...\
  mattr_accessor :app_root

  def self.enabled?(feature_name)
    feature = Feature.where(:name => feature_name).first

    if feature.present? 
      feature.status? ? true : false
    elsif
      Feature.create!(:name => feature_name, :status => true)
      return true
    end
    
  end

  def self.set_disabled?(feature_name)
    feature = Feature.where(:name => feature_name).first
    (feature.present? && feature.update_attributes(:status => false)) ? true : false
  end

end
