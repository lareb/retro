class Role < ActiveRecord::Base
  attr_accessible :name, :display_name
  has_many :user_roles

  scope :active, where("deleted_at is null")
end
