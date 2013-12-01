class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.string :name
      t.string :description
      t.integer :bindable_id
      t.string  :bindable_type
      t.string  :doc_file_name
      t.string  :doc_content_type
      t.integer :doc_file_size
      t.datetime :doc_updated_at
      t.timestamps
    end
  end
end
