class CourseTiming < ActiveRecord::Base
  attr_accessible :course_id, :time_start, :time_end

  belongs_to :course
end
