class Klass < ActiveRecord::Base
  attr_accessible :name, :display_name

  has_many :teacher_klasses
  has_many :teachers, :through => :teacher_klasses
  has_many :students
end
