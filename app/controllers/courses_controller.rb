class CoursesController < ApplicationController

  def show
    @course = Course.course_showing
    # render nothing: true
  end
end