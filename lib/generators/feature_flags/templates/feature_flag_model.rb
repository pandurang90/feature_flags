class Feature < ActiveRecord::Base

  #### IMPORTANT start ####
  ### Dont remove this as this required for memoization of features...
  include FeatureFlags::FeatureBase
  #### IMPORTANT end ####

  
  validates :name, presence: true
	
end