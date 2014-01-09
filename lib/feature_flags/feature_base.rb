module FeatureFlags
	module FeatureBase
	  extend ActiveSupport::Concern

	  included do
		  after_save :update_hash
		  after_destroy :update_hash
 		end

 		@@features_hash = {}


 		#returns features hash 
	 	def self.features
	 		##checking value in pstore if false then update to true and update features_hash
	 		pstore_value = get_pstore_value
	 		@@features_hash = {} unless (pstore_value.present? && !defined? Rails::Console)

	 		if(@@features_hash.present? && pstore_value.present?) 
	 			@@features_hash
	 		else
	 			set_hash
	 			Feature.new.update_pstore_hash
	 		end
	 		
	 		@@features_hash
	 	end

	 	###returns current value in pstore
	 	def self.get_pstore_value
	 		store = PStore.new('feature_flags')
	 		store.transaction {store[:updated]} 
	 	end

	 	#updates hash for features
	 	def self.set_hash
	 		@@features_hash = {}
	 		Feature.all.map{|f| @@features_hash[f.name.to_s.intern] = f.status}
	 		@@features_hash.freeze
	 	end
		
		def update_hash
			FeatureFlags::FeatureBase.set_hash
			update_pstore_hash
		end 

		def update_pstore_hash
			FeatureFlags.update_pstore_value(!defined? Rails::Console)
		end
	

	end
end