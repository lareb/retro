class Course < ActiveRecord::Base
  attr_accessible :name, :display_name, :description

  has_many :course_timings
  
  #might be removed in next version
  has_many :course_fees
  has_many :fees, :through => :course_fees
  
  
  has_many :fee_structures
end
