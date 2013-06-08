class CreateAdmissions < ActiveRecord::Migration
  def change
    create_table    :admissions do |t|
      t.string      :admission_no
      t.date        :admission_date

      t.string      :student_first_name
      t.string      :student_middle_name
      t.string      :student_last_name
      t.date        :date_of_birth
      t.string      :gender
      t.integer     :admission_batch_id #map to class

      t.string      :father_name
      t.string      :mother_name
      t.string      :local_guardian_name
      t.string      :relation_with_student #for local guardian

      t.integer     :last_batch #as string
      t.string      :last_batch_result #boolean pass or fail or supplementary
      t.string      :last_batch_result_in_per
      t.string      :last_institution
      t.string      :last_academic_year

      t.integer     :nationality_id
      t.string      :mother_language
      t.string      :religion
      t.string      :student_category

      t.string      :address_line1
      t.string      :address_line2
      t.string      :city
      t.string      :state
      t.string      :zip
      t.integer     :country_id
      t.string      :phone1
      t.string      :phone2
      t.string      :immediate_contact
      t.string      :guardian_email

      t.string      :occupation
      t.string      :income
      t.string      :education #parents
      t.string      :blood_group
      t.string      :birth_place
      
#      Paperclip will take care of this
#      t.string      :photo_filename
#      t.string      :photo_content_type
#      t.binary      :photo_data, :limit => 5.megabytes

      t.string      :status_description
      t.boolean     :is_active, :default => false #by default Student is not live, once admission process completed make it true
      t.boolean     :is_deleted, :default => false

      t.string      :former_id
      t.boolean     :is_sms_enabled, :default=>true
      t.timestamps
    end
  end
end
