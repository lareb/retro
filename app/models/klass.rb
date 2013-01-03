class Klass < ActiveRecord::Base
  attr_accessible :name, :display_name
  has_many :teacher, :through => :teacher_klasses
  has_many :students
end
