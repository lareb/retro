class FeeStructure < ActiveRecord::Base
  attr_accessible :course_id, :klass_id, :fee_per_session, :comments
  
  belongs_to :course
  belongs_to :klass
end
