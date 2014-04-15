class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name, :null => false, :limit => 45
      t.string :display_name, :limit => 45
      t.text   :description
      t.timestamps
    end
  end
end
