class FeeStructure < ActiveRecord::Base
  attr_accessible :course_id, :klass_id, :fee_per_session, :comments, :concession, :concession_comment
  
  belongs_to :course
  belongs_to :klass
end
