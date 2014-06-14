class Subject < ActiveRecord::Base
  attr_accessible :description, :is_live, :name

  has_many :teacher_subjects
  has_many :teachers, :through => :teacher_subjects

  scope :available_subjects, lambda{|teacher|
    unless teacher.subjects.blank?
      where("id not in (#{teacher.subjects.map(&:id).join(',')})")
    else
      where(:is_live => true)
    end
  }
  scope :active, where(:is_live => true)
end
