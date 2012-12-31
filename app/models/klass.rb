class Klass < ActiveRecord::Base
  attr_accessible :name, :display_name
  has_many :students
end
