class UpdateCourseJob < ActiveJob::Base
  queue_as :default

  def perform(*args)
    last = Course.last
    if Course.forced_course_exist.any?
      private_pub(last)
    else
      last.update!(value: Course.new().current_course, valid_to: Time.now.to_datetime)
      private_pub(last)
    end
  end

  def private_pub(obj)
    PrivatePub.publish_to "/courses", course: obj.to_json
    obj
  end
end
