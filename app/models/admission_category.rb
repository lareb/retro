class AdmissionCategory < ActiveRecord::Base
  attr_accessible :name
  
  validate :name, :presence => true, :uniqueness => true 
end
