class ChangePrecisionGlobally < ActiveRecord::Migration
  def up
    change_column :klass_fees, :amount, :decimal, :precision => 8, :scale => 2
    change_column :course_fees, :amount, :decimal, :precision => 8, :scale => 2
  end
  
  def down
    
  end
end
