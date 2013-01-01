class CreateTeacherKlasses < ActiveRecord::Migration
  def change
    create_table :teacher_klasses do |t|
      t.integer :teacher_id, :null => false
      t.integer :klass_id, :null => false
      t.boolean :is_class_teacher, :default => false
      t.timestamps
    end
  end
end
