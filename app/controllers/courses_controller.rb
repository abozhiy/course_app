class CoursesController < ApplicationController

  def show
    @course = Course.course_showing
  end
end