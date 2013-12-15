class CourseFee < ActiveRecord::Base
  attr_accessible :amount, :course_id, :cycle, :description, :fee_id
  
  validates :fee_id, :uniqueness => true

  belongs_to :course
  belongs_to :fee

end
