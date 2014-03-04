class ChangesForFee < ActiveRecord::Migration
  def change
    add_column :fees, :amount, :decimal, :precision => 8, :scale => 2
  end
end
