module FeatureFlags
  class Feature
    attr_accessor :template

    def initialize(args)
      
    end

    def enabled?(feature)
      feature = Feature.where(:name => feature).first

      if feature.present? 
        feature.status? ? true : false
      elsif
        Feature.create!(:name => feature, :status => true)
        return true
      end
      
    end

    def set_disabled?(feature)
      feature = Feature.where(:name => feature).first
      (feature.present? && feature.update_attributes(:status => false)) ? true : false
    end
  
  end
end