class FeeType < ActiveRecord::Base
  attr_accessible :description, :name

  has_many :klass_fees
  #course fee avoid now
  has_many :course_fees
end
