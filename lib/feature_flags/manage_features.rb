module FeatureFlags
  def self.enabled?(feature_name)
    get_feature(feature_name)

    # if feature.present? 
    #   feature.status? ? true : false
    # else
    #   #Feature.create!(:name => feature_name, :status => true)
    #   #return true
    #   raise "#{feature_name} feature not found."
    # end
    
  end

  def self.create_and_enable(feature_name)
    feature = Feature.new(:name => feature_name, :status => true)
    feature.save ? true : false
  end

  def self.enable(feature_name)
    feature = Feature.where(:name => feature_name).last
    if feature.present? 
      feature.update_attributes(:status => true) ? return true : return false
    else
      throw_error(feature_name)
    end
  end

  def self.set_disabled(feature_name)
    feature = Feature.where(:name => feature_name).last
    if feature.present? 
      feature.update_attributes(:status => false) ? return true : return false
    else
      throw_error(feature_name)
    end
  end

  def self.disable_all
    Feature.update_all(:status => false)
    Feature.update_hash
  end

  def self.enable_all
    Feature.update_all(:status => true)
    Feature.update_hash
  end

  def get_feature(feature_name)
    Feature::FEATURES.has_key?(feature_name) ? Feature::FEATURES[feature_name] : throw_error
  end

  def throw_error(feature_name)
    raise "#{feature_name} feature not found."
  end

end