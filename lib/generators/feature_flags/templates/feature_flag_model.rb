class FeatureFlag < ActiveRecord::Base

  validates :feature, presence: true
  validates :status, presence: true

  attr_accessible :feature, :status

end