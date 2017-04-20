class CreateTeacherSubjects < ActiveRecord::Migration
  def change
    create_table :teacher_subjects do |t|
      t.integer :teacher_id
      t.integer :subject_id
      t.timestamps
    end
  end
end
