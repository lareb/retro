class CreateFeeTypes < ActiveRecord::Migration
  def change
    create_table :fee_types do |t|
      t.string :name, :unique => true, :null => false
      t.text :description
      t.timestamps
    end
  end
end
