class CreateFees < ActiveRecord::Migration
  def change
    create_table :fees do |t|
      t.string :name, :unique => true, :null => false
      t.string :display_name
      t.text :description

      t.timestamps
    end
  end
end
