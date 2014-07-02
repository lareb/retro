class ChangePrecisionGlobally < ActiveRecord::Migration
  def change
    change_column :klass_fees, :amount, :decimal, :precision => 8, :scale => 2
    change_column :course_fees, :amount, :decimal, :precision => 8, :scale => 2
    change_column :fee_structures, :fee_per_session, :decimal, :precision => 8, :scale => 2
    add_column :fees, :is_course_fee, :boolean, :default => false
  end
end
