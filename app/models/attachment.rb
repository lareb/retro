class Attachment < ActiveRecord::Base
  attr_accessible :name, :description, :data
  has_attached_file :data, :styles => {:small => "500x200>"},
                    :whiny => false, :default_url => "/assets/web/default-stdnt.jpg"
                    #:processors => [:padder]
  #has_attached_file :data, :styles => { :small => "150x150>" }, :default_url => "/assets/msri/default_institution_logo.png"
  belongs_to :bindable, :polymorphic => true

end
