class CreateCourseFees < ActiveRecord::Migration
  def change
    create_table :course_fees do |t|
      t.integer :course_id
      t.integer :fee_id
      t.decimal :amount, precision: 5, scale: 2
      t.string :cycle
      t.text :description
      t.timestamps
    end
  end
end
