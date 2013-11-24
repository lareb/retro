class Attachment < ActiveRecord::Base
  attr_accessible :name, :description, :attachment
  has_attached_file :attachment, :styles => {:small => "400x200>"},
                    :whiny => false, :default_url => "/assets/web/default-stdnt.jpg"
                  
  belongs_to :attachmentable, :polymorphic => true
end
