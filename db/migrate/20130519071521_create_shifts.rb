class CreateShifts < ActiveRecord::Migration
  def change
    create_table :shifts do |t|
      t.string  :name
      t.string  :display_name
      t.time    :start_time
      t.time    :end_time
      t.timestamps
    end
  end
end
