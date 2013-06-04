class Admission < ActiveRecord::Base
  attr_accessible :id, :admission_no, :admission_date, :student_first_name, :student_middle_name, :student_last_name, :date_of_birth,
    :gender, :admission_batch_id, :father_name, :mother_name, :local_guardian_name, :relation_with_student, :nationality_id, :mother_language,
    :religion, :student_category, :address_line1, :address_line2, :city, :state, :zip, :country_id, :phone1, :phone2, :immediate_contact,
    :guardian_email, :occupation, :income, :education, :blood_group, :birth_place, :status_description, :is_active, :is_deleted, :former_id, 
    :is_sms_enabled, :last_batch, :last_batch_result, :last_batch_result_in_per, :last_institution, :last_academic_year

  belongs_to :klass, :foreign_key => :admission_batch_id
end
