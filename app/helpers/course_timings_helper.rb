module CourseTimingsHelper

  def get_time_in_format(course)
    times = []
    course.course_timings.each_with_index do |t, index|
      unless t.time_start.nil?
        times << t.time_start.strftime("%I:%M %p") + " to " + t.time_end.strftime("%I:%M %p").to_s
      end
    end
    times.join(" &<br/>") + "<span>#{link_to ' (+Add)', new_course_course_timing_path(course)}</span>"
  end

end
