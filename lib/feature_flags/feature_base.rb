module FeatureFlags
	module FeatureBase
	  extend ActiveSupport::Concern

	  FEATURES = {}
	  
	  after_save :update_hash

		def self.features
	 		#@@features = {}
	 		@@features.present? ? @@features : Feature.all.map{|f| @@features[f.name.to_s] = f.status} 
	 		@@features
	 	end

	  module InstanceMethods
		  def update_hash
		  	#FeatureFlags::FeatureBase::FEATURES = {}
		  	Feature.all.map{|f| FEATURES[f.name.to_s] = f.status}
		  	FEATURES.freeze
		  end
		end
	end
end