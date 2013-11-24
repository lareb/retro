class Admission < ActiveRecord::Base
  attr_accessible :id, :admission_no, :admission_date, :student_first_name, :student_middle_name, :student_last_name, :date_of_birth,
    :gender, :admission_batch_id, :father_name, :mother_name, :local_guardian_name, :relation_with_student, :nationality_id, :mother_language,
    :religion, :student_category, :address_line1, :address_line2, :city, :state, :zip, :country_id, :phone1, :phone2, :immediate_contact,
    :guardian_email, :occupation, :income, :education, :blood_group, :birth_place, :status_description, :is_active, :is_deleted, :former_id, 
    :is_sms_enabled, :last_batch, :last_batch_result, :last_batch_result_in_per, :last_institution, :last_academic_year

  has_one :asset, :as => :attachable #, :dependent =>:destroy

  has_many :admiddion_doccuments
  has_many :doccuments, :through => :admiddion_doccuments

  belongs_to :admission_batch, :foreign_key => :admission_batch_id, :class_name => Klass
  belongs_to :last_klass, :foreign_key => :last_batch, :class_name => Klass


  def admission_no
      Time.now.strftime("#{CODE}-%d%m%Y#{self.id}").upcase
  end

  def name
    [self.student_first_name.try(:capitalize), self.student_middle_name.blank? ? nil : self.student_middle_name.try(:capitalize), self.student_last_name.try(:capitalize)].compact.join(" ")
  end

  def address
    address = [name(), self.address_line1, self.address_line2, "#{self.city} #{self.state}", "#{self.zip}"].compact
    address.join("<br/>")
  end


end
