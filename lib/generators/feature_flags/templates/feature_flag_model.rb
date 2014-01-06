class Feature < ActiveRecord::Base

  validates :name, presence: true

  attr_accessible :name, :status
  after_save :update_hash
  
 	@@features = {}

 	def self.features
 		#@@features = {}
 		@@features.present? ? @@features : Feature.all.map{|f| @@features[f.name.to_s.intern] = f.status} 
 		@@features
 	end

	def update_hash
		@@features = {}
  	Feature.all.map{|f| @@features[f.name.to_s.intern] = f.status}
  	@@features.freeze
  	puts @@features.inspect
  end
	
end