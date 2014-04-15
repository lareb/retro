class KlassShift < ActiveRecord::Base
  attr_accessible :klass_id, :shift_id

  belongs_to :klass
  belongs_to :shift
end
