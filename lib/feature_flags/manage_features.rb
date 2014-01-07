module FeatureFlags
  def self.enabled?(feature_name, dependant_features = [])
    check_features(dependant_features) ? false : get_feature(feature_name)
  end

  ## checking dependant features
  def self.check_features(features)
    features.map{|feature| get_feature(feature)}.compact.include? false
  end

  def self.create_and_enable(feature_name)
    feature = Feature.new(:name => feature_name, :status => true)
    feature.save ? true : false
  end

  def self.enable(feature_name)
    feature = Feature.where(:name => feature_name).last
    throw_error(feature_name) unless feature.present?

    if feature.update_attributes(:status => true)
      return true
    else
      flash[:error] = "#{feature_name} could not be updated"
      return false
    end

  end

  def self.set_disabled(feature_name)
    feature = Feature.where(:name => feature_name).last
    throw_error(feature_name) unless feature.present?

    if feature.update_attributes(:status => false)
      return true
    else
      flash[:error] = "#{feature_name} could not be updated"
      return false
    end
  end

  #disables all features in application
  def self.disable_all
    Feature.update_all(:status => false)
    Feature.last.update_attributes(:status => false)
  end

  #enables all features in application
  def self.enable_all
    Feature.update_all(:status => true)
    Feature.last.update_attributes(:status => true)
  end

  #fetch feature's status
  def self.get_feature(feature_name)
    all_features = FeatureFlags::FeatureBase.features
    update_feature_hash unless all_features.present?
    all_features.has_key?(feature_name) ? all_features[feature_name] : throw_error(feature_name)
  end

  def self.throw_error(feature_name)
    raise "#{feature_name} feature not found."
  end

  def self.update_feature_hash
    Feature.new.update_hash
  end

end