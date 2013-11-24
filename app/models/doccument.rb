class Doccument < ActiveRecord::Base
  attr_accessible :name, :description

  has_many :admiddion_doccuments
  has_many :admiddion_doccuments, :through => :doccuments
end
