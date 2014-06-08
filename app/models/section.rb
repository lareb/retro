class Section < ActiveRecord::Base
  attr_accessible :name, :display_name, :max_studen_count, :klass_id

  belongs_to :klass
  has_many :teacher_sections
  has_many :teachers, :through => :teacher_sections

  scope :class_teacher, where(:is)
  
  def class_teacher
    self.teacher_sections.where(is_class_teacher: true).first.try(:teacher)
  end
end
