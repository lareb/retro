class CreateAdmissions < ActiveRecord::Migration
  def change
    create_table    :admissions do |t|
      t.string      :admission_no
      t.date        :admission_date

      t.string      :first_name
      t.string      :middle_name
      t.string      :last_name

      t.string      :guardian_name
      t.string      :relation
      t.string      :guardian_email
      t.string      :occupation
      t.string      :income
      t.string      :education

      t.references  :batch
      t.date        :date_of_birth
      t.string      :gender
      t.string      :blood_group
      t.string      :birth_place
      t.integer     :nationality_id
      t.string      :language
      t.string      :religion
      t.references  :student_category

      t.string      :address_line1
      t.string      :address_line2
      t.string      :city
      t.string      :state
      t.string      :pin_code
      t.integer     :country_id

      t.string      :phone1
      t.string      :phone2
      t.string      :email

      t.string      :photo_filename
      t.string      :photo_content_type
      t.binary      :photo_data, :limit => 5.megabytes

      t.string      :status_description
      t.boolean     :is_active, :default => true
      t.boolean     :is_deleted, :default => false

      t.references  :immediate_contact
      t.string      :former_id
      t.boolean     :is_sms_enabled, :default=>true

      t.timestamps
    end
  end
end
