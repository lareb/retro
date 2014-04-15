class ChangesForFee < ActiveRecord::Migration
  def change
    add_column :fee_structures, :concession, :decimal, :precision => 8, :scale => 2
    add_column :fee_structures, :concession_comment, :string
  end
end
