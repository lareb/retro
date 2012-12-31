class Student < ActiveRecord::Base
  attr_accessible :address_1, :address_2, :blood_group, :contact_no_1, :contact_no_2, :dob, :enrollment_no, :father_name, :first_name, :klass_id, :last_name, :local_guardian_name, :mother_name, :roll_no, :city, :state, :pincode, :country, :gender
  belongs_to :klass


  def name
    "#{self.first_name.try(:capitalize)} #{self.last_name.try(:capitalize)}"
  end

  def address
    address = [name(), self.address_1, self.address_2, "#{self.city} #{self.state}", "#{self.country} #{self.pincode}"].compact
    address.join("<br/>")
  end
end
