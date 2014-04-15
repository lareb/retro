class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.string  :name, :null => false, :limit => 45
      t.string  :display_name, :null => false, :limit => 45
      t.integer :max_studen_count
      t.integer :klass_id
      t.timestamps
    end
  end
end
