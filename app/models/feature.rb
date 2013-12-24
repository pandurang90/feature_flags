class Feature < ActiveRecord::Base

  validates :name, presence: true

  attr_accessible :name, :status
  attr_accessor :features

  after_save :update_hash

  def update_hash
  	FEATURES = {}
  	Feature.all.map{|f| FEATURES[f.name.to_s] = f.status}
  	FEATURES.freeze
  end
end