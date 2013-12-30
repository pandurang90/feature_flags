module FeatureFlags
	module FeatureBase
	  extend ActiveSupport::Concern

	  FEATURES = {}
	  
	  after_save :update_hash

	  module InstanceMethods
		  def update_hash
		  	FEATURES = {}
		  	Feature.all.map{|f| FEATURES[f.name.to_s] = f.status}
		  	FEATURES.freeze
		  end
		end
	end
end