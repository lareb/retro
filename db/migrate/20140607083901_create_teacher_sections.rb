class CreateTeacherSections < ActiveRecord::Migration
  def change
    create_table :teacher_sections do |t|
      t.integer :teacher_id, :null => false
      t.integer :section_id, :null => false
      t.boolean :is_class_teacher, :default => false
      t.timestamps
    end
  end
end
