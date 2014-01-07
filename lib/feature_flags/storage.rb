module FeatureFlags
  
  def self.update_pstore_value(updated = true)
  	store = PStore.new('updated_from_console')
  	store.transaction do
			store[:updated] = updated
  	end
  end 

end