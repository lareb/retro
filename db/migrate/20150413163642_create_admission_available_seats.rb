class CreateAdmissionAvailableSeats < ActiveRecord::Migration
  def change
    create_table :admission_available_seats do |t|
      t.integer :klass_id, :null => false
      t.integer :seats, :default => 0
      t.string  :session
      t.timestamps
    end
  end
end
