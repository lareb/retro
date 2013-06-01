class Course < ActiveRecord::Base
  attr_accessible :name, :display_name, :description

  has_many :course_timings
end
