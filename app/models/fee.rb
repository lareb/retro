class Fee < ActiveRecord::Base
  attr_accessible :description, :display_name, :name

  has_many :klass_fees
  has_many :course_fees
end
