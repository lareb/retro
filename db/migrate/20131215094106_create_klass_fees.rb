class CreateKlassFees < ActiveRecord::Migration
  def change
    create_table :klass_fees do |t|
      t.integer :klass_id
      t.integer :fee_type_id
      t.decimal :amount, precision: 5, scale: 2
      t.string :cycle
      t.text :description
      t.timestamps
    end
  end
end
