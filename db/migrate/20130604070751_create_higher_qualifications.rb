class CreateHigherQualifications < ActiveRecord::Migration
  def change
    create_table :higher_qualifications do |t|
      t.string :name, :null => false, :limit => 45
      t.string :description, :limit => 200
      t.timestamps
    end
  end
end
