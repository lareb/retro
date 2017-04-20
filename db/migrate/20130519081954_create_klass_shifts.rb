class CreateKlassShifts < ActiveRecord::Migration
  def change
    create_table :klass_shifts do |t|
      t.integer :klass_id
      t.integer :shift_id
      t.timestamps
    end
  end
end
