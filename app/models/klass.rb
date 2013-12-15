class Klass < ActiveRecord::Base
  attr_accessible :name, :display_name, :max_studen_count

  has_many :klass_shifts
  has_many :shifts, :through => :klass_shifts #multiple shifts can be run

  has_many :teacher_klasses
  has_many :teachers, :through => :teacher_klasses
  has_many :students

  has_many :sections
  has_many :admissions  #,:foreign_key => 'admission_batch_id'

  has_many :klass_fees
  has_many :fees, :through => :klass_fees
end
