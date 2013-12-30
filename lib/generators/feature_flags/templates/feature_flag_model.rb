class Feature< ActiveRecord::Base
  include FeatureFlags::FeatureBase

  validates :name, presence: true

  attr_accessible :name, :status

end