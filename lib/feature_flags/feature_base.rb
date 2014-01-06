module FeatureFlags
	module FeatureBase
	  extend ActiveSupport::Concern

	  included do
		  after_save :update_hash
 		end

 		@@features_hash = {}


	 	def self.features
	 		#@@features = {}
	 		@@features_hash.present? ? @@features_hash : Feature.all.map{|f| @@features_hash[f.name.to_s.intern] = f.status} 
	 		@@features_hash
	 	end

	 	def self.set_hash
	 		@@features_hash = {}
	 		Feature.all.map{|f| @@features_hash[f.name.to_s.intern] = f.status}
	 		@@features_hash.freeze
	 	end
		
	  module InstanceMethods
			def update_hash
				FeatureFlags::FeatureBase.set_hash
			end 
		end

	end
end