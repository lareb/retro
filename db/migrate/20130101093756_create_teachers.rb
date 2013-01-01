class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.string  :title, :limit => 20
      t.string  :first_name, :limit => 45, :null => false
      t.string  :last_name, :limit => 45
      t.integer :user_id
      t.boolean :is_live, :default => true
      t.string  :higher_degree
      t.string  :contact_no_1
      t.string  :contact_no_2
      t.string  :address
      t.timestamps
    end
  end
end
