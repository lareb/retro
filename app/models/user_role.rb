class UserRole < ActiveRecord::Base
  attr_accessible :user_id, :role_id, :modified_by, :deleted_at

  belongs_to :user
  belongs_to :role
end
