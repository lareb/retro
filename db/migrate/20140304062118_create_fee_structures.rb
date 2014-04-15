class CreateFeeStructures < ActiveRecord::Migration
  def change
    create_table :fee_structures do |t|
      t.integer :course_id, :null => false
      t.integer :klass_id, :null => false
      t.decimal :fee_per_session, precision: 5, scale: 2
      t.string  :comments, :limit => 100
      t.integer :fee_id   
      t.integer :fee_cycle_id
      t.boolean :is_refundable
      t.timestamps
    end
  end
end
