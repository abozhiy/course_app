class UpdateCourseJob < ActiveJob::Base
  queue_as :default

  def perform(*args)
    last = Course.last
    if Course.forced_course_exist.any?
      last
    else
      last.update!(value: Course.new().current_course, valid_to: Time.now.to_datetime)
      last
    end
  end
end
