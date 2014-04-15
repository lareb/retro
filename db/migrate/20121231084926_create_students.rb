class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :first_name, :null => false, :limit => 45
      t.string :last_name, :null => false, :limit => 45
      t.string :father_name, :null => false, :limit => 45
      t.string :mother_name, :limit => 45
      t.string :local_guardian_name, :null => true, :limit => 45
      t.string :address_1, :null => false
      t.string :address_2
      t.string :city
      t.string :state
      t.string :pincode
      t.string :country
      t.string :contact_no_1, :null => false, :limit => 45
      t.string :contact_no_2
      t.date :dob, :null => false
      t.string :gender
      t.string :blood_group, :limit => 5
      t.integer :klass_id, :null => false
      t.string :roll_no, :null => false
      t.string :enrollment_no, :null => false
      t.timestamps
    end
  end
end
