class AdmiddionDoccument < ActiveRecord::Base
  attr_accessible :doccument_id, :admission_id

  belongs_to :doccument
  belongs_to :admission
  #has_one :asset, :as => :attachable #, :dependent =>:destroy
end
