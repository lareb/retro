class HigherQualification < ActiveRecord::Base
  attr_accessible :name, :description

  has_many :teachers
end
