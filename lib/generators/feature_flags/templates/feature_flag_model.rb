class Feature< ActiveRecord::Base

  validates :name, presence: true
  validates :status, presence: true

  attr_accessible :name, :status

end