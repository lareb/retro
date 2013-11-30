class AdmissionDocument < ActiveRecord::Base
  attr_accessible :admission_id, :document_id

  belongs_to :admission
  belongs_to :document
  
  has_many  :attachments, :as => :bindable #, :dependent =>:destroy
end
