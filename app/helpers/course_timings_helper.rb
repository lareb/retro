module CourseTimingsHelper

  def get_time_in_format(course)
    times = []
    course.course_timings.each_with_index do |t, index|
      times << t.time_start.strftime("#{index + 1}. %I:%M %p") + " to " + t.time_end.strftime("#{index + 1}. %I:%M %p")
    end
    times.join("<br/>") + "<span>#{link_to 'Add', new_course_course_timing_path(course)}</span>"
  end

end
