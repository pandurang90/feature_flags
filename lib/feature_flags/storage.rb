module FeatureFlags
  
  #storing toggle value inside pstore if in case someone updates from rails console
  def self.update_pstore_value(updated = true)
  	store = PStore.new('feature_flags')
  	store.transaction do
			store[:updated] = updated
  	end
  end 

end