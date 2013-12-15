class Course < ActiveRecord::Base
  attr_accessible :name, :display_name, :description

  has_many :course_timings
  
  has_many :course_fees
  has_many :fees, :through => :course_fees
end
