class CreateAdmissionCategories < ActiveRecord::Migration
  def change
    create_table :admission_categories do |t|
      t.string :name
      t.timestamps
    end
  end
end
