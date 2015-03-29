class KlassFee < ActiveRecord::Base
  attr_accessible :amount, :cycle, :description, :fee_type_id, :klass_id

  validates :fee_type_id, :uniqueness => {:scope => :klass_id}

  belongs_to :klass
  belongs_to :fee_type
end
