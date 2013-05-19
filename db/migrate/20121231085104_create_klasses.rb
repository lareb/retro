class CreateKlasses < ActiveRecord::Migration
  def change
    create_table :klasses do |t|
      t.string  :name, :null => false, :limit => 4
      t.string  :display_name, :null => false, :limit => 45
      t.integer :max_studen_count
      t.timestamps
    end
  end
end
