class CreateAdmissionDocuments < ActiveRecord::Migration
  def change
    create_table :admission_documents do |t|
      t.integer :admission_id
      t.integer :document_id
      t.timestamps
    end
  end
end
