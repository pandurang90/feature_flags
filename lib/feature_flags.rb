
require "feature_flags/version"
require "feature_flags/configuration"
require "feature_flags/engine"
require "active_support/dependencies"

module FeatureFlags
  # Your code goes here...\

  def self.enabled?(feature_name)
    feature = Feature.where(:name => feature_name).first

    if feature.present? 
      feature.status? ? true : false
    elsif
      #Feature.create!(:name => feature_name, :status => true)
      #return true

      raise "#{feature_name} feature not found."
    end
    
  end

  def self.create_and_enable
  end

  def self.set_disabled(feature_name)
    feature = Feature.where(:name => feature_name).first
    (feature.present? && feature.update_attributes(:status => false)) ? true : false
  end

  def self.disable_all
    Feature.update_all(:status => false)
  end

  def self.enable_all
    Feature.update_all(:status => true)
  end

end
