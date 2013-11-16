class Asset < ActiveRecord::Base
  attr_accessible :name, :description, :data
  has_attached_file :data, :styles => {:small => "150x150>", :thumb => {:geometry => "100x100>"}},
                    :whiny => false #,
                    #:processors => [:padder]
  #has_attached_file :data, :styles => { :small => "150x150>" }, :default_url => "/assets/msri/default_institution_logo.png"
  belongs_to :attachable, :polymorphic => true

end
