class KlassFee < ActiveRecord::Base
  attr_accessible :amount, :cycle, :description, :fee_id, :klass_id

  validates :fee_id, :uniqueness => true

  belongs_to :klass
  belongs_to :fee
end
