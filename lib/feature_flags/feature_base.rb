module FeatureFlags
	module FeatureBase
	  extend ActiveSupport::Concern

	  included do
		  after_save :update_hash
 		end

 		@@features_hash = {}


 		#returns features hash 
	 	def self.features
	 		#@@features = {}
	 		store = PStore.new('updated_from_console')
	 		pstore_value = store.transaction {store[:updated]} 
	 		(@@features_hash.present? && pstore_value.present?) ? @@features_hash : Feature.all.map{|f| @@features_hash[f.name.to_s.intern] = f.status} 
	 		@@features_hash
	 	end

	 	#updates hash for features
	 	def self.set_hash
	 		@@features_hash = {}
	 		Feature.all.map{|f| @@features_hash[f.name.to_s.intern] = f.status}
	 		@@features_hash.freeze
	 	end
		
	  module InstanceMethods
			def update_hash
				FeatureFlags::FeatureBase.set_hash
				update_pstore_hash
			end 

			def update_pstore_hash
				FeatureFlags.update_pstore_value(!defined? Rails::Console)
			end
		end

	end
end