class TeacherSection < ActiveRecord::Base
  attr_accessible :teacher_id, :section_id, :is_class_teacher

  belongs_to :teacher
  belongs_to :section
  
  default_scope order("is_class_teacher desc")
  #scope :class_teacher, where(is_class_teacher: true).limit(1)
end
