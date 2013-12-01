class AdmissionDocument < ActiveRecord::Base
  attr_accessible :admission_id, :document_id

  belongs_to :admission
  belongs_to :document
  
  has_one  :attachment, :as => :bindable, :dependent =>:destroy
end
