class CreateAdmiddionDoccuments < ActiveRecord::Migration
  def change
    create_table :admiddion_doccuments do |t|
      t.integer :doccument_id
      t.integer :admission_id
      t.timestamps
    end
  end
end
