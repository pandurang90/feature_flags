module FeatureFlags
  def self.enabled?(feature_name)
    feature = Feature.where(:name => feature_name).last

    if feature.present? 
      feature.status? ? true : false
    else
      #Feature.create!(:name => feature_name, :status => true)
      #return true
      raise "#{feature_name} feature not found."
    end
    
  end

  def self.create_and_enable(feature_name)
    feature = Feature.new(:name => feature_name, :status => true)
    feature.save ? true : false
  end

  def self.enable(feature_name)
    feature = Feature.where(:name => feature_name).last
    if feature.present? 
      
      if feature.update_attributes(:status => true)
        return true
      else
        false
      end
    else
      raise "#{feature_name} feature not found."
    end
  end

  def self.set_disabled(feature_name)
    feature = Feature.where(:name => feature_name).last
    if feature.present? 

      if feature.update_attributes(:status => false)
        return true
      else
        false
      end
    else
      raise "#{feature_name} feature not found."
    end
  end

  def self.disable_all
    Feature.update_all(:status => false)
  end

  def self.enable_all
    Feature.update_all(:status => true)
  end

end