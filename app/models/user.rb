class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :role_ids

  validates_uniqueness_of :email
  validates_format_of :email, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i, :message => "Invalid email, please select an valid email"

  has_one  :teacher
  has_many :user_roles
  has_many :roles, :through => :user_roles

  def name
    "#{self.teacher.try(:name)}"
  end

  def role?(role)
    if role.instance_of?Array
      return !self.roles.where(:name => role).empty?
    else
      return !!self.roles.find_by_name(role.to_s)
    end
  end

end
