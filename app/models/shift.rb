class Shift < ActiveRecord::Base
  attr_accessible :name, :display_name, :start_time, :end_time

  has_many :klass_shifts
  has_many :klasses, :through => :klass_shifts #multiple classes can be run in one shift
end
