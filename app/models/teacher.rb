class Teacher < ActiveRecord::Base
  attr_accessible :title, :first_name, :last_name, :user_id, :is_live, :higher_degree, :contact_no_1, :contact_no_2, :address, :user

  has_many :teacher_klasses
  has_many :klasses, :through => :teacher_klasses

  has_many :teacher_subjects
  has_many :subjects, :through => :teacher_subjects

  belongs_to :user

  def name
    "#{self.title} #{self.first_name.try(:capitalize)} #{self.last_name.try(:capitalize)}"
  end

end
