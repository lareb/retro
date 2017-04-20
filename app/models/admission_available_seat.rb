class AdmissionAvailableSeat < ActiveRecord::Base
  attr_accessible :klass_id, :seats, :session
  
  belongs_to :klass
end
