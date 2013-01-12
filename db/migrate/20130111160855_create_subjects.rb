class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.string :name
      t.string :description
      t.boolean :is_live, :default => true
      t.timestamps
    end
  end
end
