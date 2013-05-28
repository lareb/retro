class Admission < ActiveRecord::Base
  attr_accessible :address_line1, :address_line2, :admission_no, :birth_place, :blood_group, :city, :education, :email, :first_name, :gender, :guardian_email, :guardian_name, :income, :language, :last_name, :middle_name, :occupation, :phone1, :phone2, :photo_content_type, :photo_filename, :pin_code, :relation, :religion, :state, :status_description, :batch_id

end
