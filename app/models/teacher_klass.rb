class TeacherKlass < ActiveRecord::Base
  attr_accessible :teacher_id, :klass_id, :is_class_teacher

  belongs_to :teacher
  belongs_to :klass
end
