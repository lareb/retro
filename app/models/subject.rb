class Subject < ActiveRecord::Base
  attr_accessible :description, :is_live, :name

  has_many :teacher_subjects
  has_many :teachers, :through => :teacher_subjects

end
