class Feature

  def initialize(args)
    
  end

  def enabled?(feature)
    feature = FeatureFlag.where(:feature => feature).first

    if feature.present? 
      feature.status? ? return true : return false
    elsif
      FeatureFlag.create(:feature => feature, :status => true)
      return true
    end
    
  end

  def set_disabled?(feature)
    feature = FeatureFlag.where(:feature => feature).first
    (feature.present? && feature.update_attributes(:status => false)) ? true : false
  end
  
end