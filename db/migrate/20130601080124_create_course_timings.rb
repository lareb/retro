class CreateCourseTimings < ActiveRecord::Migration
  def change
    create_table  :course_timings do |t|
      t.integer   :course_id, :null => false
      t.time      :time_start
      t.time      :time_end
      t.timestamps
    end
  end
end
