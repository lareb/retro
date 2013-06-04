class TeacherSubject < ActiveRecord::Base
  attr_accessible :teacher_id, :subject_id

  belongs_to :teacher
  belongs_to :subject
end
