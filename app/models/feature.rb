class Feature< ActiveRecord::Base

  validates :name, presence: true

  attr_accessible :name, :status

end