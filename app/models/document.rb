class Document < ActiveRecord::Base
  attr_accessible :name, :description

  validates :name, presence: true, uniqueness: true

  #has_many :admiddion_doccuments
  #has_many :admiddion_doccuments, :through => :documents
end
