class Teacher < ActiveRecord::Base
  attr_accessible :title, :first_name, :last_name, :user_id, :is_live, :higher_degree, :contact_no_1, :contact_no_2, :address

  def name
    "#{self.title} #{self.first_name.try(:capitalize)} #{self.last_name.try(:capitalize)}"
  end

end
